

import 'package:flutter/material.dart';

import '../../model/word.dart';

class CreateSetPage extends StatefulWidget {
  const CreateSetPage({Key? key}) : super(key: key);
  final String title = "Create a Word Set";

  @override
  _CreateSetPageState createState() => _CreateSetPageState();
}

class _CreateSetPageState extends State<CreateSetPage> {
  late List<Word> _wordList;

  @override
  void initState() {
    _wordList = generateWordList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Select a set to sets",
            style: Theme.of(context).textTheme.headline5,
          ),
          Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
                //shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _wordList.length,
                itemBuilder: (BuildContext context, int index) {
                  var word = _wordList[index];
                  print(
                      "${word.id} - original: ${word.original}, translation: ${word.translation}, url: ${word.imgURL}, success: ${word.success}");
                  return listElement(word);
                }),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
    );
  }

  List<Word> generateWordList() {
    return List.generate(
        10,
        (index) => index < 6
            ? Word(index, "TR-word", "ENG-word", "img-url", true)
            : Word(index, "TR-word", "ENG-word", "img-url", true));
  }

  Widget listElement(Word word) {
    return Container(
        //decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(16),),
        margin: const EdgeInsets.all(16),
        child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(16), // same with child
            child: InkWell(
                splashColor: Colors.white30,
                onTap: () {
                  print("The WORD with id: ${word.id} is clicked");

                },
                child: Ink(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .primaryColorDark, //Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              word.original,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              word.translation,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Divider(
                              thickness: 2,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                      Container(),
                    ])))));
  }
}
