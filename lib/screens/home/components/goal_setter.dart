

import 'package:flutter/material.dart';

class GoalSetter extends StatefulWidget {
  const GoalSetter({Key? key}) : super(key: key);

  @override
  _GoalSetterState createState() => _GoalSetterState();
}

class _GoalSetterState extends State<GoalSetter> {
  late int _goal;

  @override
  void initState() {
    _goal = 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Set a Daily Goal", style: Theme.of(context).textTheme.headlineSmall,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: _decrement,
                    child: const Icon(Icons.remove),
                  clipBehavior: Clip.hardEdge,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$_goal", style: Theme.of(context).textTheme.headline4,),
                ),
                ElevatedButton(
                    onPressed: _increment,
                    child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _decrement() {
    setState(() {
      if (_goal > 0) {
        if(_goal <= 10){
          _goal--;
        }else{
          _goal -= 5;
        }
      }
    });
  }

  void _increment() {
    setState(() {
      if(_goal < 10){
        _goal++;
      }else{
        _goal += 5;
      }
    });
  }
}
