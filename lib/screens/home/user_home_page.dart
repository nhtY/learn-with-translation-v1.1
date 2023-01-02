import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/goal_setter.dart';
import 'components/progress_percentage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = "Home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // height of the navbar
    final navBarHeight = MediaQuery.of(context).padding.bottom;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var isPortrait = MediaQuery.of(context).orientation;

    // Determine the design according to the orientation of the device
    return isPortrait == Orientation.portrait
        ? buildColumnForPortrait(width, navBarHeight)
        : buildRowForLandscape(height);
  }

  Widget buildColumnForPortrait(double sizeWH, double navBarHeight) {
    return Column(
      children: [
        ProgressPercentage(size: sizeWH),
        const Expanded(child: SizedBox()),
        const GoalSetter(),

        // this is used so that GoalSetter does not lays out under the buttomNavBar, locate as high as the height of the navbar
        SizedBox( height: navBarHeight,
        )
      ],
    );
  }

  Widget buildRowForLandscape(double sizeWH) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: ProgressPercentage(size: sizeWH)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(child: GoalSetter()),
            ],
          ),
        ],
      ),
    );
  }
}
