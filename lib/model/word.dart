
class Word {
  late int _id;
  late String _original;
  late String _translation;
  late String _imgURL;
  late bool _success;  // When taking quiz, if user knows translation correctly

  Word(this._id, this._original, this._translation, this._imgURL, this._success);

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }


  String get imgURL => _imgURL;

  set imgURL(String value) {
    _imgURL = value;
  }

  String get translation => _translation;

  set translation(String value) {
    _translation = value;
  }

  String get original => _original;

  set original(String value) {
    _original = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}

