import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nova_chatgpt_ui/Widgets/info_text.dart';
import 'package:nova_chatgpt_ui/Widgets/message_bar.dart';
import 'package:provider/provider.dart';

import '../Provider/chat.dart';
import '../Widgets/chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (_){
        Provider.of<Chat>(context,listen: false).chatList = [];
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'NOVA',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.share))
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.back,
              size: 30,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Consumer<Chat>(
                builder: (ctx,chat,child) {
                  return Expanded(
                      child: chat.chatList.isEmpty?  const InfoText() : ChatList()
                  );
                },
              ),
              const MessageBar(),
            ],
          ),
        ),
      ),
    );
  }
}
