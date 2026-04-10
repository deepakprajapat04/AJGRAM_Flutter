import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, String>> messages = [];

  void sendMessage() {
    String userMsg = controller.text.trim();

    if (userMsg.isEmpty) return;

    setState(() {
      messages.add({"sender": "user", "text": userMsg});
    });

    String botReply = getBotReply(userMsg);

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({"sender": "bot", "text": botReply});
      });
    });

    controller.clear();
  }

  String getBotReply(String message) {
    message = message.toLowerCase().trim();

    // Greetings
    if (message.contains("hello") ||
        message.contains("hi") ||
        message.contains("hey")) {
      return "Hi! Welcome to AJGRAM 👋";
    }

    // Product related
    else if (message.contains("product") ||
        message.contains("shop") ||
        message.contains("buy")) {
      return "You can check products in the Products section 🛍️";
    }

    // Location
    else if (message.contains("location") ||
        message.contains("gps") ||
        message.contains("where")) {
      return "Use the Location feature to get your GPS coordinates 📍";
    }

    // Help
    else if (message.contains("help") || message.contains("support")) {
      return "I can help you with login, products, and navigation.";
    }

    // Login
    else if (message.contains("login")) {
      return "Use your email and password to login 🔐";
    }

    // Default fallback
    else {
      return "Try typing: hello, product, location, help 😊";
    }
  }

  Widget buildMessage(Map<String, String> msg) {
    bool isUser = msg["sender"] == "user";

    return Container(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          msg["text"]!,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatbot"),
        backgroundColor: const Color.fromRGBO(20, 120, 200, 1),
      ),
      body: Column(
        children: [
          // Chat messages
          Expanded(
            child: ListView(
              children: messages.map((msg) => buildMessage(msg)).toList(),
            ),
          ),

          // Input box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
