import 'package:flutter/material.dart';
import '../community/community_detail.dart';

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

  int _index = 0;
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
          child: SafeArea(child: Builder(builder: (BuildContext context) {
            return CustomScrollView(
              key: new PageStorageKey<String>('SchoolCommunity'),
              slivers: <Widget>[
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
                                    title: Text('社团 $url'),
                                    subtitle: Text(
                                      '关注:100 成员:50',
                                      textScaleFactor: .8,
                                    ),
                                  ),
                                  child: Image.asset(url, fit: BoxFit.cover),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return CommunityDetail();
                                      },
                                    ),
                                  );
                                },
                              ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          })),
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
