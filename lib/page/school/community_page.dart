import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  @override
  State createState() {
    return _CommunityPageState();
  }
}

class _CommunityPageState extends State<CommunityPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  TabController _tabController;
  ScrollController _controller;

  int _index = 2;
  final List<Tab> _myTabs = <Tab>[
    new Tab(
      text: '热门',
    ),
    new Tab(
      text: '体育',
    ),
    new Tab(
      text: '电脑',
    ),
    new Tab(
      text: '摄影',
    ),
    new Tab(
      text: '绘画',
    ),
    new Tab(
      text: '出游',
    ),
    new Tab(
      text: '校园',
    ),
    new Tab(
      text: '社团',
    ),
    new Tab(
      text: '同学',
    ),
    new Tab(
      text: '校园',
    ),
    new Tab(
      text: '社团',
    ),
    new Tab(
      text: '同学',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        TabBar(
          tabs: _myTabs,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: new TextStyle(fontSize: 16.0),
          unselectedLabelStyle: new TextStyle(fontSize: 12.0),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text('$index'),
                ),
            itemCount: _index,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: _myTabs.length,
      initialIndex: _index,
      vsync: this,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _index = _tabController.index;
        setState(() {});
      }
    });
    _controller = ScrollController();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
