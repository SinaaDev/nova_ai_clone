import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset('assets/appicon.png'),
            ),
          ),
          const SizedBox(height: 24,),
          const Text(
            'NOVA',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Hi, I'm Nova! Powered by ChatGPT. Let me know if you have any questions or requests in your preferred language.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
