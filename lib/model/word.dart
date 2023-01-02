
class Word {
  late String _original;
  late String _translation;
  late bool _success;  // When taking quiz, if user knows translation correctly

  Word(this._original, this._translation, this._success);

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  String get translation => _translation;

  set translation(String value) {
    _translation = value;
  }

  String get original => _original;

  set original(String value) {
    _original = value;
  }
}

