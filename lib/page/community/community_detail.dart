import 'package:flutter/material.dart';
import 'community_activity.dart';
import 'community_news.dart';
import 'community_member.dart';
import 'communityl_post.dart';

class CommunityDetail extends StatefulWidget {
  @override
  State createState() {
    return _CommunityDetailState();
  }
}

class _CommunityDetailState extends State<CommunityDetail>
    with TickerProviderStateMixin {
  TabController _tabController;
  double _position = .0;
  double _appBarHeight = 200.0;
  bool _isFavorite = false;
  final List<Tab> _myTabs = <Tab>[
    new Tab(
      text: '动态',
    ),
    new Tab(
      text: '活动',
    ),
    new Tab(
      text: '成员',
    )
  ];

  @override
  Widget build(BuildContext context) {
    Widget _appBar = SliverAppBar(
      pinned: true,
      title: Text('莘莘团'),
      centerTitle: true,
      expandedHeight: _appBarHeight - _position,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/c.jpg',
              fit: BoxFit.cover,
            ),
            Positioned(
              child: FloatingActionButton(
                onPressed: () {
                  _isFavorite = !_isFavorite;
                  setState(() {});
                },
                child: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                mini: true,
              ),
              right: 0.0,
              bottom: 22.0,
            )
          ],
        ),
      ),
      bottom: PreferredSize(
        child: TabBar(
          tabs: _myTabs,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: new TextStyle(fontSize: 16.0),
          unselectedLabelStyle: new TextStyle(fontSize: 12.0),
        ),
        preferredSize: Size(double.infinity, 22.0),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return CommunityPost();
                },
              ),
            );
          },
        ),
      ],
    );
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _appBar,
            ),
          ];
        },
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return TabBarView(
                children: [
                  CommunityNews(
                    callback: _callback,
                  ),
                  CommunityActivity(
                    callback: _callback,
                  ),
                  CommunityMember(
                    callback: _callback,
                  ),
                ],
                controller: _tabController,
              );
            },
          ),
        ),
      ),
    );
  }

  void _callback(double position) {
    _position = position;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: _myTabs.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
