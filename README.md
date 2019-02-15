# flutter_shenshen

shenshen

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


[sliver](https://blog.csdn.net/yumi0629/article/details/83305627)


[时间选择控件](https://pub.dartlang.org/packages/flutter_cupertino_date_picker)

[模态底部面板](https://blog.csdn.net/hekaiyou/article/details/60782951)

[网络请求](https://pub.dartlang.org/packages/dio#-readme-tab-)

[redux](https://pub.dartlang.org/packages/flutter_redux#-installing-tab-)


[Flutter：实现一个滑动头部折叠的动画效果](https://blog.csdn.net/yumi0629/article/details/81775805)

[flutter顶部折叠动画](https://blog.csdn.net/u011272795/article/details/82740389)


[json处理](https://flutterchina.club/json/)

[json处理，适合大项目](https://github.com/dart-lang/json_serializable/tree/master/example)

定义模板
```
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  final int code;
  final String status;
  final String msg;
  @JsonKey(nullable: false)
  List<Item> data;

  User(this.code, this.status, this.msg, {List<Item> data})
      : data = data ?? <Item>[];
}

@JsonSerializable(includeIfNull: false)
class Item {
  String title;
  List<UserDetail> data;
  Item()

}

@JsonSerializable()
class UserDetail {
  int id;
  String name;

  UserDetail()
}

@JsonLiteral('user.json')
Map get glossaryData => _$glossaryDataJsonLiteral;




```



flutter packages pub run build_runner build 生成模板


[flutter的redux](https://www.jianshu.com/p/34a6224e0cf1)

[redux 修改主题](https://www.codercto.com/a/28285.html)

[定制路由](https://blog.csdn.net/hekaiyou/article/details/72853738)

[SliverAppBar](https://juejin.im/post/5bceb534e51d457aa4596f9a)