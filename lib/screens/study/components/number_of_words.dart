
import 'package:flutter/material.dart';
import '../../../model/word_set.dart';

class NumberOfWords extends StatelessWidget {
  const NumberOfWords({
    Key? key,
    required this.wordSet,
  }) : super(key: key);

  final WordSet wordSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(
            "${wordSet.numberOfWords}",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          Text("Words",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary))
        ],
      ),
    );
  }
}


