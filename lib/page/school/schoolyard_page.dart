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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '输入高校名称搜索',
              icon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/c.jpg'),
                    ),
                    title: Text('大学    ${index}'),
                    subtitle: Text('成员：10W    关注：10K   社团：100'),
                    trailing: Icon(Icons.keyboard_arrow_right),
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
