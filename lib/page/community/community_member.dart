import 'package:flutter/material.dart';

typedef ScrollControllerCallback(double position);

class CommunityMember extends StatefulWidget {
  final ScrollControllerCallback callback;
  final double appBarHeight;

  CommunityMember({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _CommunityMemberState();
  }
}

class _CommunityMemberState extends State<CommunityMember>
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
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      key: new PageStorageKey<String>('CommunityMember'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Text('community_member $index'),
              childCount: 55,
            ),
          ),
        ),
      ],
    );
  }
}
