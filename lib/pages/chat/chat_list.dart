import 'package:flutter/material.dart';
import 'package:sampark_app/pages/chat/chat_title.dart';
import 'package:sampark_app/config/images.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "John Doe",
            lastChat: "Hey, how are you?",
            lastTime: "10:30 AM",
          ),
          const ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "Jane Smith",
            lastChat: "Let's meet tomorrow.",
            lastTime: "Yesterday",
          ),
          ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "John Doe",
            lastChat: "Hey, how are you?",
            lastTime: "10:30 AM",
          ),
          const ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "Jane Smith",
            lastChat: "Let's meet tomorrow.",
            lastTime: "Yesterday",
          ),
          ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "John Doe",
            lastChat: "Hey, how are you?",
            lastTime: "10:30 AM",
          ),
          const ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "Jane Smith",
            lastChat: "Let's meet tomorrow.",
            lastTime: "Yesterday",
          ),
          ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "John Doe",
            lastChat: "Hey, how are you?",
            lastTime: "10:30 AM",
          ),
          const ChatTitle(
            imageUrl: AssetsImages.defaultprofile, // Use your actual asset path
            name: "Jane Smith",
            lastChat: "Let's meet tomorrow.",
            lastTime: "Yesterday",
          ),
        ],
      ),
    );
  }
}
