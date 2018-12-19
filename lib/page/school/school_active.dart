import 'package:flutter/material.dart';

typedef ScrollControllerCallback(double position);

class SchoolActive extends StatefulWidget {
  ScrollControllerCallback callback;
  double appBarHeight;

  SchoolActive({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _SchoolActiveState();
  }
}

class _SchoolActiveState extends State<SchoolActive> {
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
      key: new PageStorageKey<String>('SchoolActive'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Text('$index'),
              childCount: 55),
        )
      ],
    );
  }
}
