import 'package:flutter/material.dart';
import 'school_detail_page.dart';

class SchoolyardPage extends StatefulWidget {
  @override
  State createState() {
    return _SchoolyardPageState();
  }
}

class _SchoolyardPageState extends State<SchoolyardPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  ScrollController _controller;
  bool _isShowSearch = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      double _position = _controller.position.pixels;
      if (_position >= 200.0) {
        _isShowSearch = false;
      } else {
        _isShowSearch = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Offstage(
            offstage: _isShowSearch,
            child: TextField(
              decoration: InputDecoration(
                hintText: '输入高校名称搜索',
                icon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemBuilder: (BuildContext context, int index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/c.jpg'),
                    ),
                    title: Text('大学    $index'),
                    subtitle: Text('成员：10W    关注：10K   社团：100'),
                    trailing: Icon(Icons.navigate_next),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return SchoolDetailPage();
                          },
                        ),
                      );
                    },
                  ),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
