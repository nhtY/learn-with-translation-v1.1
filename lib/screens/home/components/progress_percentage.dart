import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressPercentage extends StatefulWidget {
  const ProgressPercentage({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  _ProgressPercentageState createState() => _ProgressPercentageState();
}

class _ProgressPercentageState extends State<ProgressPercentage> {
  int _goal = 10;
  int _completed = 5;
  double _percentage = 0;

  @override
  void initState() {
    setState(() {
      _percentage = (_completed / _goal);
      print('percentage = $_percentage');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('percentage: $_percentage in build method');
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset.fromDirection(1, 4),
                  blurRadius: 8,
                  blurStyle: BlurStyle.normal,
                  color: const Color.fromRGBO(0, 0, 0, 20.0),
                  spreadRadius: 0)
            ]),

        //
        child: Center(
          child: CircularPercentIndicator(
            radius: widget.size * .2,
            percent: _percentage,
            header: Text("Progress: $_completed / $_goal",
                style: Theme.of(context).textTheme.headline5),
            center: Text('%${(_percentage * 100).ceil()}',
                style: Theme.of(context).textTheme.headline5),
            circularStrokeCap: CircularStrokeCap.round,
            lineWidth: 16.0,
            rotateLinearGradient: true,
            linearGradient: _linearGradient(),
            animation: true,
            animateFromLastPercent: true,
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }

  LinearGradient _linearGradient() {
    var percentage = _percentage * 100;
    if (percentage <= 40.0) {
      return const LinearGradient(
        colors: [Colors.red, Colors.orangeAccent],
      );
    } else if (40.0 < percentage && percentage < 60.0) {
      return const LinearGradient(
          colors: [Colors.orange, Colors.yellow, Colors.lightGreen]);
    } else if (60.0 <= percentage && percentage < 80.0) {
      return const LinearGradient(
          colors: [Colors.yellow, Colors.limeAccent, Colors.lightGreen]);
    } else {
      return const LinearGradient(colors: [Colors.limeAccent, Colors.green]);
    }
  }
}
