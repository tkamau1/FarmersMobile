// lib/screens/chat_screen.dart

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, String> expert;

  const ChatScreen({super.key, required this.expert});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = []; // List of messages with sender info
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.expert['name']}'),
      ),
      body:
      Column(
        children: <Widget>[
          Expanded(
            child: messages.isEmpty
                ? Center(
              child: Text(
                'Start a conversation with ${widget.expert['name']}!',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
                : ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 48.0,
                  width: 48.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, size: 24.0),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          messages.add({
                            'text': _controller.text,
                            'sender': 'user', // Add sender info here
                          });
                          _controller.clear();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, String> message) {
    bool isUser = message['sender'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[700] : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          message['text']!,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }
}