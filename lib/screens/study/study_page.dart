import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_with_translation/model/word.dart';
import 'package:learn_with_translation/model/word_set.dart';

import 'components/last_studied.dart';
import 'components/number_of_words.dart';
import 'components/success_widget.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);
  final String title = "Study";

  @override
  _StudyPageState createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  late List<WordSet> _wordSets;

  @override
  void initState() {
    _wordSets = generateWordSetList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Select a set to study", style: Theme.of(context).textTheme.headline5,),
          Expanded(
            child: ListView.builder(
                //shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _wordSets.length,
                itemBuilder: (BuildContext context, int index) {
                  var wordSet = _wordSets[index];
                  print("${wordSet.id} - success rate: ${wordSet.successRate}");
                  return listElement(wordSet);
                }),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).padding.bottom,
          // )
        ],
      ),
    );
  }

  List<WordSet> generateWordSetList() {
    return List.generate(6, (index) {
      var words =
          List.generate(10, (index) => index < 6? Word("TR-word", "ENG-worn", true) : Word("TR-word", "ENG-worn", false));
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
      margin:const EdgeInsets.all(16),

      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(16), // same with child
        child: InkWell(
          splashColor: Colors.white30,
          onTap: (){
            print("The wordSet with id: ${wordSet.id} is clicked");
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
                        SuccessWidget(successRate: wordSet.successRate,),
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

  Widget successWidget(double succcessRate) {
    var colors = [
      Theme.of(context).colorScheme.background,
      Theme.of(context).colorScheme.background,
      Theme.of(context).colorScheme.background
    ];

    if (succcessRate <= .5) {
      colors[0] = Colors.deepOrange;
    } else if (.5 < succcessRate && succcessRate < .75) {
      colors[0] = Colors.limeAccent;
      colors[1] = Colors.limeAccent;
    } else {
      colors[0] = Colors.lightGreenAccent;
      colors[1] = Colors.lightGreenAccent;
      colors[2] = Colors.lightGreenAccent;
    }

    return Row(
      children: [
        successRateBox(colors[0]),
        successRateBox(colors[1]),
        successRateBox(colors[2]),
      ],
    );
  }

  Widget successRateBox(Color color) {
    return ClipPath(
      clipper: SuccessRateClipper(),
      child: Container(
        margin: const EdgeInsets.all(2),
        //padding: EdgeInsets.all(2),
        width: 32,
        height: 16,
        color: color,
      ),
    );
  }


}



class SuccessRateClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    Path path0 = Path();
    path0.lineTo(w * .3, h);
    path0.lineTo(w, h);
    path0.lineTo(w * .7, 0);
    path0.close();

    return path0;
    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
