import 'package:flutter/material.dart';
import './page/school/school_page.dart';
import './page/user/user_page.dart';
import './page/explore/explore_page.dart';
import './page/encounter/encounter.dart';

class MainPage extends StatefulWidget {
  @override
  State createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        key: Key('MainPage'),
        children: <Widget>[
          Encounter(),
          SchoolPage(),
          ExplorePage(),
          UserPage(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('遇见'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.school),
            title: new Text('高校'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text('发现'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('我的'),
          )
        ],
        currentIndex: page,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);
  }
}
