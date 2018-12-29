import 'package:flutter/material.dart';

typedef ScrollControllerCallback(double position);

class SchoolQuestion extends StatefulWidget {
  final ScrollControllerCallback callback;
  final double appBarHeight;

  SchoolQuestion({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _SchoolQuestionState();
  }
}

class _SchoolQuestionState extends State<SchoolQuestion>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;
  double _appBarHeight = 200.0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      key: new PageStorageKey<String>('SchoolQuestion'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  Text('school_question ' '$index'),
              childCount: 55),
        )
      ],
    );
  }
}
