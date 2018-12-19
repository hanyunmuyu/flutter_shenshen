import 'package:flutter/material.dart';

class AttentionPage extends StatefulWidget {
  @override
  State createState() {
    return _AttentionPageState();
  }
}

class _AttentionPageState extends State<AttentionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('attention_page');
  }
}
