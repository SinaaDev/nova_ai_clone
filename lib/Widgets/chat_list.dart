import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/chat.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = Provider.of<Chat>(context);
    return ListView.builder(
      itemCount: chat.chatList.length,
      itemBuilder: (ctx, i) => ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            chat.chatList[i].user == 'NOVA'
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/appicon.png',
                    height: 25,
                    width: 25,
                  ),
                )
                : Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 20,
                    ),
                  )
          ],
        ),
        title:Text(
                chat.chatList[i].user,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
        subtitle: chat.chatList[i].user == 'NOVA'
            ? AnimatedTextKit(
          totalRepeatCount: 1,
            animatedTexts: [
          TypewriterAnimatedText(
            speed: const Duration(milliseconds: 30),
            chat.chatList[i].text,
          )
        ])
            :  Text(chat.chatList[i].text),
      ),
    );
  }
}

class Chats {
  final String text;
  final String user;

  Chats({required this.text, required this.user});
}
