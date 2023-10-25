import 'package:dicoding_flutter/model/chat.dart';
import 'package:flutter/material.dart';

class UserChat extends StatelessWidget {
  final Chat chat;
  const UserChat({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat.isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: chat.isBot ? Colors.orange : Colors.green,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.message),
                Text(
                  '${chat.date.hour < 10 ? "0${chat.date.hour}" : chat.date.hour}:${chat.date.minute < 10 ? "0${chat.date.minute}" : chat.date.minute}',
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
