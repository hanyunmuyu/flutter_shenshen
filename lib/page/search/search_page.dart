import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Theme(
            data: Theme.of(context).copyWith(
              brightness: Brightness.light,
              accentColor: Colors.white
            ),
            child: TextField()),
      ),
    );
  }
}
