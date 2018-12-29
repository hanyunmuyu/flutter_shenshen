import 'package:flutter/material.dart';
import '../community/community_detail.dart';

typedef ScrollControllerCallback(double position);

class SchoolCommunity extends StatefulWidget {
  final ScrollControllerCallback callback;
  final double appBarHeight;

  SchoolCommunity({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _SchoolCommunityState();
  }
}

class _SchoolCommunityState extends State<SchoolCommunity>
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
      key: new PageStorageKey<String>('SchoolCommunity'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(2.0),
          sliver: SliverGrid.count(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: <String>[
              'images/c.jpg',
              'images/lf.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/lf.jpg',
              'images/c.jpg',
              'images/lf.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/lf.jpg',
              'images/c.jpg',
              'images/lf.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/c.jpg',
              'images/lf.jpg',
            ]
                .map<Widget>(
                  (String url) => GestureDetector(
                        child: GridTile(
                          footer: GridTileBar(
                            title: Text('社团 ${url}'),
                            subtitle: Text(
                              '关注:100 成员:50',
                              textScaleFactor: .8,
                            ),
                          ),
                          child: Image.asset(url, fit: BoxFit.cover),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return CommunityDetail();
                          }));
                        },
                      ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
