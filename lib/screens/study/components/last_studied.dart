
import 'package:flutter/material.dart';

import '/model/word_set.dart';

class LastStudied extends StatefulWidget {
  const LastStudied({
    Key? key,
    required this.wordSet,
  }) : super(key: key);

  final WordSet wordSet;

  @override
  State<LastStudied> createState() => _LastStudiedState();
}

class _LastStudiedState extends State<LastStudied> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: Text("Studied:",
              style: TextStyle(
                  color:
                  Theme.of(context).colorScheme.onSecondary,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  fontWeight: FontWeight.w100)),
        ),
        Text(
            "${widget.wordSet.lastStudied.day}/${widget.wordSet.lastStudied.month}/"
                "${widget.wordSet.lastStudied.year}",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontStyle: FontStyle.italic,
                fontSize: 14,
                fontWeight: FontWeight.w100))
      ],
    );
  }
}
