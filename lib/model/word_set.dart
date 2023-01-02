

import 'package:learn_with_translation/model/word.dart';

class WordSet {
  late int _id;
  late String _title;
  late String _description;
  late int _numberOfWords;
  late double _successRate;
  late DateTime _lastStudied;

  late List<Word> _wordList;

  WordSet(
      this._id ,this._title, this._description, this._numberOfWords, this._successRate,
      this._lastStudied, {required List<Word> wordList })
  {
    _wordList = wordList;
  }

  DateTime get lastStudied => _lastStudied;

  set lastStudied(DateTime value) {
    _lastStudied = value;
  }


  double get successRate => _successRate;

  set successRate(double value) {
    _successRate = value;
  }

  int get numberOfWords => _numberOfWords;

  set numberOfWords(int value) {
    _numberOfWords = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  List<Word> get wordList => _wordList;

  set wordList(List<Word> value) {
    _wordList = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}

