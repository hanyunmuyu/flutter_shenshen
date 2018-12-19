import 'package:flutter/material.dart';

typedef ScrollControllerCallback(double position);

class SchoolCommunity extends StatefulWidget {
  ScrollControllerCallback callback;
  double appBarHeight;

  SchoolCommunity({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _SchoolCommunityState();
  }
}

class _SchoolCommunityState extends State<SchoolCommunity> {
  ScrollController _scrollController;
  double _appBarHeight = 200.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(
            () {
          double _p = _scrollController.position.pixels
              .toDouble()
              .clamp(.0, _appBarHeight);
          if (_p < widget.appBarHeight) {
            if (widget.callback != null) {
              widget.callback(_p);
            }
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      key: new PageStorageKey<String>('SchoolCommunity'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Text('school_community ''$index'),
              childCount: 55),
        )
      ],
    );
  }
}
