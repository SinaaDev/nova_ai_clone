import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<BotItem> list = [
    BotItem(title: 'ChatGPT', image: 'assets/chatgpt.jpg'),
    BotItem(title: 'GPT-4', image: 'assets/gpt4.jpg'),
    BotItem(title: 'LLAMA 2', image: 'assets/llama.jpg'),
    BotItem(title: 'Google\nGemini', image: 'assets/gimini.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: CupertinoButton(
          borderRadius: BorderRadius.circular(30),
          padding: EdgeInsets.zero,
          minSize: 20,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.star_fill,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text('3')
            ],
          ),
          onPressed: () {},
        ),
        actions: [
          CupertinoButton(
            borderRadius: BorderRadius.circular(30),
            padding: EdgeInsets.zero,
            minSize: 35,
            onPressed: () {},
            color: Colors.white,
            child: const Icon(
              CupertinoIcons.desktopcomputer,
              color: Colors.black,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          CupertinoButton(
            borderRadius: BorderRadius.circular(30),
            padding: EdgeInsets.zero,
            minSize: 35,
            onPressed: () {},
            color: Colors.white,
            child: const Icon(
              CupertinoIcons.person_fill,
              color: Colors.black,
              size: 20,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 52,
            ),
            const Text(
              'NOVA',
              style: TextStyle(fontSize: 36),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const ChatScreen()));
              },
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 24),
                margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Text(
                  'Ask a question...',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Expanded(
              child: Material(
                elevation: 50,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Bots',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            CupertinoButton(
                              borderRadius: BorderRadius.circular(30),
                              padding: EdgeInsets.zero,
                              minSize: 40,
                              onPressed: () {},
                              color: Colors.grey[100],
                              child: const Icon(
                                CupertinoIcons.pen,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, childAspectRatio: 7 / 9),
                          itemCount: list.length + 1,
                          itemBuilder: (ctx, i) {
                            // Check if the current index is the last item
                            if (i == list.length) {
                              // Render the "plus" button
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              // Render the BotsItem for other items in the list
                              return BotsItem(
                                  title: list[i].title, image: list[i].image);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        child: BottomNavigationBar(
          currentIndex: 1,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_stack_3d_up_fill),
                label: 'Store'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.archivebox_fill), label: 'Chats'),
          ],
        ),
      ),
    );
  }
}

class BotsItem extends StatelessWidget {
  final String title;
  final String image;

  const BotsItem({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class BotItem {
  final String title;
  final String image;

  BotItem({
    required this.title,
    required this.image,
  });
}
