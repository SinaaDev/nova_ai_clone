import 'package:flutter/material.dart';
import 'package:nova_chatgpt_ui/Widgets/chat_list.dart';

class Chat with ChangeNotifier {
  final userMessage = TextEditingController();

  List<Chats> chatList = [];


  void sendMessage() async{
    chatList.add(Chats(text: userMessage.text, user: 'YOU'));
    userMessage.clear();
    chatList.add(
      Chats(
        text:
        'Sorry you are not connected to internet, Please try again later.',
        user: 'NOVA',
      ),
    );
    notifyListeners();
  }
}
