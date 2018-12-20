import 'package:flutter/material.dart';
import 'schoolyard_page.dart';
import 'community_page.dart';
import 'student_page.dart';

class SchoolPage extends StatefulWidget {
  @override
  State createState() {
    return _SchoolPageState();
  }
}

class _SchoolPageState extends State<SchoolPage> with TickerProviderStateMixin {
  TabController _tabController;

  final List<Tab> _myTabs = <Tab>[
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      body: TabBarView(
        key: ObjectKey('SchoolPage'),
        children: [
          SchoolyardPage(),
          CommunityPage(),
          StudentPage(),
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
      initialIndex: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
