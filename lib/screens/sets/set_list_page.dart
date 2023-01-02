
import 'package:flutter/material.dart';

class SetListPage extends StatefulWidget {
  const SetListPage({Key? key}) : super(key: key);
  final String title = "Sets";

  @override
  _SetListPageState createState() => _SetListPageState();
}

class _SetListPageState extends State<SetListPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Set List Page"),
    );
  }
}


