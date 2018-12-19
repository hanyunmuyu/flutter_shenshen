import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  @override
  State createState() {
    return _StudentPageState();
  }
}

class _StudentPageState extends State<StudentPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('student_page');
  }
}
