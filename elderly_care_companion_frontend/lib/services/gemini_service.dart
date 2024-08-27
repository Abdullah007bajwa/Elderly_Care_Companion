import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class GeminiService {
  final String apiKey;
  final FlutterTts _flutterTts = FlutterTts();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  GeminiService({required this.apiKey}) {
    _speech = stt.SpeechToText();
  }

  Future<void> initialize() async {
    await _speech.initialize();
    _startListening();
  }

  void _startListening() async {
    if (!_isListening) {
      _isListening = true;
      _speech.listen(
        onResult: (result) {
          if (result.recognizedWords.contains('mate')) {
            _handleCommand(result.recognizedWords);
          }
        },
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 5),
        partialResults: true,
        onSoundLevelChange: (level) => print('Sound level: $level'),
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
      );
    }
  }

  Future<void> _handleCommand(String command) async {
    // Stop listening to avoid recursive calls
    _speech.stop();
    _isListening = false;

    // Process command with Gemini
    final response = await interactWithGemini(command);

    // Use text-to-speech to read out the response
    await _flutterTts.speak(response);

    // Restart listening
    _startListening();
  }

  Future<String> interactWithGemini(String query) async {
    final url = Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': query,
        'max_tokens': 100,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['text'];
    } else {
      throw 'Failed to communicate with Gemini API';
    }
  }
}
