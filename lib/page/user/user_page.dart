import 'package:flutter/material.dart';
import '../seeting/setting_page.dart';
import 'package:flutter/cupertino.dart';
import '../../service/UserService.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../redux/AppState.dart';

class UserPage extends StatefulWidget {
  @override
  State createState() {
    return _UserPageState();
  }
}

class _UserPageState extends State<UserPage> {
  bool _lightBulb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingPage(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/c.jpg'),
            ),
            title: Text('hanyun'),
            subtitle: Text('账号：6666'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('个人中心'),
                Icon(Icons.navigate_next),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('20'),
                  Text('粉丝'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('66'),
                  Text('关注'),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('100'),
                  Text('访客'),
                ],
              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('我的社团'),
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('我的校园'),
            trailing: Icon(Icons.navigate_next),
          ),
          new StoreConnector<AppState, Store>(
            builder: (context, store) {
              return ListTile(
                leading: Icon(
                    !_lightBulb ? Icons.lightbulb_outline : Icons.wb_sunny),
                title: Text('夜间模式'),
                trailing: Switch(
                  value: _lightBulb,
                  onChanged: (bool v) {
                    if (v) {
                      UserService.changeUserTheme(store, 'dark', false);
                    } else {
                      UserService.initTheme(store);
                    }
                    setState(() {
                      _lightBulb = !_lightBulb;
                    });
                  },
                ),
              );
            },
            converter: (store) => store,
          ),
          ListTile(
            leading: Icon(Icons.games),
            title: Text('更多主题'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('关于我们'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          new StoreConnector<AppState, Store>(
            builder: (context, store) {
              return FlatButton(
                onPressed: () {
                  UserService.logout(context, store);
                },
                child: new Text('退出'),
              );
            },
            converter: (store) => store,
          ),
        ],
      ),
    );
  }
}
