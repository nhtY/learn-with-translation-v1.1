import 'package:flutter/material.dart';
import 'package:learn_with_translation/model/word.dart';
import 'package:learn_with_translation/model/word_set.dart';

import '../create_set/create_set_page.dart';
import 'components/last_studied.dart';
import 'components/number_of_words.dart';
import 'components/success_widget.dart';

class SetsPage extends StatefulWidget {
  const SetsPage({Key? key}) : super(key: key);
  final String title = "Study";

  @override
  _SetsPageState createState() => _SetsPageState();
}

class _SetsPageState extends State<SetsPage> {
  late List<WordSet> _wordList;

  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _wordList = generateWordSetList();
    //_focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // _focus.removeListener(_onFocusChange);
    // _focus.dispose();
  }

  void _onFocusChange() {
    // debugPrint("Focus: ${_focus.hasFocus.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBox(),
        Text(
          "Select a set to sets",
          style: Theme.of(context).textTheme.headline5,
        ),
        const Divider(thickness: 2, height: 0),
        Expanded(
          child: ListView.builder(
              //shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _wordList.length,
              itemBuilder: (BuildContext context, int index) {
                var wordSet = _wordList[index];
                print("${wordSet.id} - success rate: ${wordSet.successRate}");
                return listElement(wordSet);
              }),
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).padding.bottom,
        // )
      ],
    );
  }

  List<WordSet> generateWordSetList() {
    return List.generate(6, (index) {
      var words = List.generate(
          10,
          (index) => index < 6
              ? Word(index, "TR-word", "ENG-worn", "img-url", true)
              : Word(index, "TR-word", "ENG-worn", "img-url", false));
      var successRate =
          (words.where((element) => element.success == true)).length /
              words.length;
      return WordSet(index, "title-$index", "description-$index", words.length,
          successRate, DateTime.now(),
          wordList: words);
    });
  }

  Widget listElement(WordSet wordSet) {
    return Container(
      //decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(16),),
      margin: const EdgeInsets.all(16),

      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16), // same with child
        child: InkWell(
          splashColor: Colors.white30,
          onTap: () {
            print("The wordSet with id: ${wordSet.id} is clicked");
            if (_focus.hasFocus) {
              // dismiss keyboard
              FocusManager.instance.primaryFocus?.unfocus();
            } else {
              // delayed to see the splash effect
              Future.delayed(const Duration(milliseconds: 50), () =>Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const CreateSetPage(),
                ),
              ));
            }
          },
          child: Ink(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColorDark, //Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wordSet.title,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      wordSet.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.white70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SuccessWidget(
                          successRate: wordSet.successRate,
                        ),
                        LastStudied(wordSet: wordSet)
                      ],
                    )
                  ],
                )),
                NumberOfWords(wordSet: wordSet),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    var w = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //height: 32,
          width: w * .6,
          margin: const EdgeInsets.all(8),
          //padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            focusNode: _focus,
            controller: _controller,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "search word set"),
          ),
        ),
        Material(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
          child: IconButton(
            onPressed: () {
              print("Search for: ...Önce search sonra keyboard dismiss");
              // dissmiss keyboard
              FocusManager.instance.primaryFocus?.unfocus();
              // delayed to see the splash effect
              Future.delayed(const Duration(milliseconds: 50), () =>Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const CreateSetPage(),
                ),
              ));
            },
            splashColor: Colors.white,
            icon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onSecondary),
          ),
        )
      ],
    );
  }
}
