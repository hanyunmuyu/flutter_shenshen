import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
//          new StoreConnector<AppState, Store>(
//            builder: (context, store) {
//              return new FlatButton(
//                color: Theme.of(context).primaryColor,
//                textColor: Colors.white,
//                onPressed: () {
//                  UserService.logout(context, store);
//                },
//                child: new Text('退出'),
//              );
//            },
//            converter: (store) => store,
//          ),
          new StoreConnector<AppState, Store>(
            builder: (context, store) {
              return new FlatButton(
                color: Colors.purple,
                textColor: Colors.white,
                child: new Text('purple'),
                onPressed: () {
                  UserService.changeUserTheme(
                    store,
                    'purple',
                  );
                },
              );
            },
            converter: (store) => store,
          ),
          new StoreConnector<AppState, Store>(
            builder: (context, store) {
              return new FlatButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: new Text('blue'),
                onPressed: () {
                  UserService.changeUserTheme(store, 'blue');
                },
              );
            },
            converter: (store) => store,
          ),
          new StoreConnector<AppState, Store>(
            builder: (context, store) {
              return new FlatButton(
                textColor: Colors.white,
                color: Colors.black,
                child: new Text('dark'),
                onPressed: () {
                  UserService.changeUserTheme(store, 'dark');
                },
              );
            },
            converter: (store) => store,
          ),
        ],
      ),
    );
  }
}
