import 'package:flutter/material.dart';
import 'package:nova_chatgpt_ui/Provider/chat.dart';
import 'package:nova_chatgpt_ui/Screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>Chat(),
      child: MaterialApp(
        title: 'Nova',
        debugShowCheckedModeBanner: false,
        home: Home()
      ),
    );
  }
}
