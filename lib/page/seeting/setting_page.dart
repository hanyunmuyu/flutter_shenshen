import 'package:flutter/material.dart';
import '../../service/UserService.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../../redux/AppState.dart';

class SettingPage extends StatefulWidget {
  @override
  State createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(4.0),
        child: ListView(
          children: <Widget>[
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    UserService.logout(context, store);
                  },
                  child: new Text('退出'),
                );
              },
              converter: (store) => store,
            ),
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
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  child: new Text('deepPurple'),
                  onPressed: () {
                    UserService.changeUserTheme(
                      store,
                      'deepPurple',
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
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: new Text('pink'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'pink');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: new Text('red'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'red');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: new Text('orange'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'orange');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: new Text('amber'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'amber');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.lime,
                  child: new Text('lime'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'lime');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: new Text('green'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'green');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.teal,
                  child: new Text('teal'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'teal');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.cyan,
                  child: new Text('cyan'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'cyan');
                  },
                );
              },
              converter: (store) => store,
            ),
            new StoreConnector<AppState, Store>(
              builder: (context, store) {
                return new FlatButton(
                  textColor: Colors.white,
                  color: Colors.yellow,
                  child: new Text('yellow'),
                  onPressed: () {
                    UserService.changeUserTheme(store, 'yellow');
                  },
                );
              },
              converter: (store) => store,
            ),
          ],
        ),
      ),
    );
  }
}
