import 'package:flutter/material.dart';
import 'attention_page.dart';
import 'recommend_page.dart';
import 'nearby_page.dart';

class ExplorePage extends StatefulWidget {
  @override
  State createState() {
    return _ExplorePageState();
  }
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> _myTabs = <Tab>[
    new Tab(
      text: '关注',
    ),
    new Tab(
      text: '推荐',
    ),
    new Tab(
      text: '附近',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TabBar(
          tabs: _myTabs,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          labelStyle: new TextStyle(fontSize: 16.0),
          unselectedLabelStyle: new TextStyle(fontSize: 12.0),
        ),
      ),
      body: TabBarView(
        key: ObjectKey('SchoolPage'),
        children: [
          AttentionPage(),
          RecommendPage(),
          NearbyPage(),
        ],
        controller: _tabController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: _myTabs.length,
      initialIndex: 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
