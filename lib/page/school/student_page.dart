import 'package:flutter/material.dart';
import '../user/user_detail.dart';

class StudentPage extends StatefulWidget {
  @override
  State createState() {
    return _StudentPageState();
  }
}

class _StudentPageState extends State<StudentPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/c.jpg'),
            ),
            title: Text('hanyhun'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('院校：河南工业大学'),
                Text('关注：轮滑社团 英语社团'),
                Text('座右铭：走自己的路让别人无路可走'),
              ],
            ),
            dense: true,
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return UserDetail();
                  },
                ),
              );
            },
            contentPadding: const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 4.0,
            ),
          ),
      itemCount: 25,
    );
  }
}
