import 'package:flutter/material.dart';
import 'dart:math';
import '../user/user_detail.dart';

class Encounter extends StatefulWidget {
  @override
  State createState() {
    return _EncounterState();
  }
}

class _EncounterState extends State<Encounter>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  String _avatar = '';

  final _avatarList = [
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/c.jpg',
    'images/lf.jpg',
    'images/lf.jpg',
  ];
  double _startPositionY = .0;
  double _endPositionY = .0;

  initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: 0.0, end: 30.0).animate(curve);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    _avatar = _getAvatarSrc();
  }

  String _getAvatarSrc() {
    return _avatarList[Random.secure().nextInt(_avatarList.length)];
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('邂逅'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            child: Opacity(
              opacity: .9,
              child: Container(
                width: _width,
                height: _height,
                child: Image.asset(
                  _avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onVerticalDragDown: (DragDownDetails d) {
              _startPositionY = d.globalPosition.dy;
            },
            onVerticalDragStart: (DragStartDetails d) {
              _startPositionY = d.globalPosition.dy;
            },
            onVerticalDragUpdate: (DragUpdateDetails d) {
              _endPositionY = d.globalPosition.dy;
            },
            onVerticalDragEnd: (DragEndDetails d) {
              if ((_endPositionY - _startPositionY).abs() > 30.0) {
                _avatar = _getAvatarSrc();
                setState(() {});
              }
              _startPositionY = .0;
              _endPositionY = .0;
            },
            onVerticalDragCancel: () {
              _startPositionY = .0;
              _endPositionY = .0;
            },
            onTap: () {
              print(1);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return UserDetail();
                  },
                ),
              );
            },
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '匹配指数：90',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '生活不止眼前的苟且，还有诗于远方',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            left: 18.8,
            bottom: 88.6,
          ),
          Positioned(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.local_florist,
                  color: Colors.white,
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ],
            ),
            right: 10.0,
            bottom: _width * 0.5,
          ),
          AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return Positioned(
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 36.0,
                ),
                left: _width / 2 - 18.0,
                bottom: animation.value,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
