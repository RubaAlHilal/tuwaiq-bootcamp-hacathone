import 'package:flutter/material.dart';
import 'package:star_app/networking/openai_networking/ai_neworking.dart';

import '../components/chat_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

TextEditingController questionController = TextEditingController();
String answer = "";

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/stars-galaxy.gif"),
        )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Ask The AI Astronomer",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15)),
                  height: 55,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 6,
                        child: TextField(
                          maxLines: 1,
                          controller: questionController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Ask Astronomer AI",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: IconButton(
                            onPressed: () async {
                              final answerGPT = await AINetworking()
                                  .connectGPT(msg: questionController.text);

                              answer = answerGPT;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                              size: 28,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Flexible(
                flex: 0,
                child: SingleChildScrollView(
                  primary: true,
                  child: Column(
                    children: [
                      ChatContainer(
                        textEntry: "Username:\n${questionController.text}",
                        isUser: true,
                      ),
                      ChatContainer(
                        textEntry: "Astronomer AI:\n$answer",
                        isUser: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
