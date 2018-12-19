import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  @override
  State createState() {
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('recommend_page');
  }
}
