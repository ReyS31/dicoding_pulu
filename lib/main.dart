import 'package:dicoding_flutter/component/user_chat.dart';
import 'package:dicoding_flutter/model/chat.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PuluApp());
}

class PuluApp extends StatelessWidget {
  const PuluApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const PuluPage(title: 'Pulu Pulu'),
    );
  }
}

class PuluPage extends StatefulWidget {
  const PuluPage({super.key, required this.title});
  final String title;

  @override
  State<PuluPage> createState() => _PuluPageState();
}

class _PuluPageState extends State<PuluPage> {
  List<Chat> chats = [
    Chat(message: "PULU PULU!!!!", isBot: true),
  ];

  final _textController = TextEditingController();
  final _scrollController = ScrollController();

  void sendChat() {
    List<String> randPulu = ["PULU", "PULUUUU", "PUL"];

    final message = _textController.text;
    final msgLength = message.split(' ').length;

    List<String> pulu = List.empty(growable: true);
    for (var i = 0; i < msgLength; i++) {
      randPulu.shuffle();
      pulu.add(randPulu.first);
    }
    String suffix = msgLength % 2 == 0 ? "!!!!!" : "??!!!";

    setState(() {
      chats.add(Chat(message: message, isBot: false));

      chats.add(Chat(message: "${pulu.join(' ')}$suffix", isBot: true));

      _textController.clear();

      if (_scrollController.position.maxScrollExtent > 0) {
        _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent + 120.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, index) => UserChat(chat: chats[index]),
              itemCount: chats.length,
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: _textController,
                  onEditingComplete: sendChat,
                ),
              )),
              IconButton(onPressed: sendChat, icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    );
  }
}
