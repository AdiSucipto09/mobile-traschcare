import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class chatbot extends StatelessWidget {
  const chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
}
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: const Color.fromRGBO(78, 96, 76, 1)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: 'Type your message'),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _handleSubmitted(_textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(text: text, isBot: false);
    setState(() {
      _messages.insert(0, message);
    });

    // Make an HTTP request to the Flask server
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/api/chatbot-mobile'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': text}),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String botResponse = data['message'];
        ChatMessage botMessage = ChatMessage(text: botResponse, isBot: true);
        setState(() {
          _messages.insert(0, botMessage);
        });
      } else {
        // Handle error
        print('Failed to get response from Flask API');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isBot;

  ChatMessage({required this.text, this.isBot = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isBot
              ? Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    // Widget or image to display for the chatbot
                    backgroundImage: AssetImage('images/logo.png'),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    // Widget or image to display for the user
                    backgroundImage: AssetImage('images/profil.png'),
                  ),
                ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isBot ? 'TrashCare' : 'User',
                    style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}