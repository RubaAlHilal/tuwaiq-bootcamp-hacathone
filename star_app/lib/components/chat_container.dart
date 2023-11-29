import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.textEntry,
    required this.isUser,
  });

  final String textEntry;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        alignment: Alignment.topLeft,
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
            maxHeight: isUser ? 120 : 500,
            maxWidth: 400,
            minHeight: 110,
            minWidth: 275),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isUser
                ? const Color.fromARGB(255, 6, 10, 56)
                : Colors.white.withOpacity(0.8)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isUser ? Colors.white70 : Colors.black,
            ),
            child: SingleChildScrollView(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(textEntry,
                      textAlign: TextAlign.justify)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
