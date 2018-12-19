import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './redux/AppState.dart';
import './model/ThemeModel.dart';
import './main_page.dart';
import './page/search/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(
      themeModel: new ThemeModel('purple'),
      user: null,
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  State createState() {
    return new _App();
  }
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, Store>(
      builder: (context, store) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeModel.map[store.state.themeModel.themeData],
          routes: <String, WidgetBuilder>{
            '/search': (BuildContext context) => SearchPage()
          },
          home: new MainPage(),
        );
      },
      converter: (store) => store,
    );
  }
}
