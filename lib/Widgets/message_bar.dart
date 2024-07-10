import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/chat.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({super.key});

  @override
  Widget build(BuildContext context) {
    final chat = Provider.of<Chat>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          CupertinoButton(
            color: Colors.grey.shade200,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(30),
            child: Icon(
              Icons.add,
              color: Colors.grey.shade600,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: chat.userMessage,
                onSubmitted:(_)=> chat.sendMessage(),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Message',
                    suffixIcon: Icon(CupertinoIcons.mic_fill),
                    suffixIconColor: Colors.black54,
                    hintStyle: TextStyle(color: Colors.black54)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
