import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Import the text-to-speech package

class ConversationalAIScreen extends StatefulWidget {
  const ConversationalAIScreen({super.key});

  @override
  _ConversationalAIScreenState createState() => _ConversationalAIScreenState();
}

class _ConversationalAIScreenState extends State<ConversationalAIScreen> {
  final List<Map<String, String>> _messages = [
    {'text': 'Hello! How can I assist you today?', 'sender': 'AI'},
    {'text': 'What is the weather like?', 'sender': 'User'},
  ];

  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late FlutterTts _flutterTts;

  @override
  void initState() {
    super.initState();
    _flutterTts = FlutterTts();
  }

  void _sendMessage(String text) {
    setState(() {
      _messages.add({'text': text, 'sender': 'User'});
      _messages.add({'text': 'Processing...', 'sender': 'AI'});
    });

    // Simulate AI response delay
    Future.delayed(const Duration(seconds: 1), () async {
      const aiResponse = 'It’s sunny and 25°C outside.'; // Replace with AI service call
      setState(() {
        _messages.removeLast();
        _messages.add({'text': aiResponse, 'sender': 'AI'});
      });

      // Speak out the response
      await _flutterTts.speak(aiResponse);

      // Scroll to the bottom
      _scrollToBottom();
    });

    _textController.clear();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      controller: _scrollController,
      reverse: true,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[_messages.length - 1 - index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Align(
            alignment: message['sender'] == 'AI'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: message['sender'] == 'AI'
                    ? Colors.grey[200]
                    : Colors.blue[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                message['text']!,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onSubmitted: _sendMessage,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _sendMessage(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversational AI Companion'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildMessageList(),
          ),
          _buildInputField(),
        ],
      ),
    );
  }
}
