

import 'package:flutter/material.dart';

class SuccessWidget extends StatefulWidget {
  const SuccessWidget({Key? key, required this.successRate}) : super(key: key);

  final double successRate;

  @override
  _SuccessWidgetState createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  @override
  Widget build(BuildContext context) {
    var colors = [
      Theme.of(context).colorScheme.background,
      Theme.of(context).colorScheme.background,
      Theme.of(context).colorScheme.background
    ];

    if (widget.successRate <= .5) {
      colors[0] = Colors.deepOrange;
    } else if (.5 < widget.successRate && widget.successRate < .75) {
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


