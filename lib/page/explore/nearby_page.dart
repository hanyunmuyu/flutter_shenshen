import 'package:flutter/material.dart';

class NearbyPage extends StatefulWidget {
  @override
  State createState() {
    return _NearbyPageState();
  }
}

class _NearbyPageState extends State<NearbyPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('nearby_page');
  }
}
