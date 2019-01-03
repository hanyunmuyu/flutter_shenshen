import 'package:flutter/material.dart';

class UserDetail extends StatefulWidget {
  @override
  State createState() {
    return _UserDetailState();
  }
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    Widget _appBar = SliverAppBar(
      pinned: true,
      title: Text('hanyun'),
      centerTitle: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'images/c.jpg',
              fit: BoxFit.cover,
            ),
            Positioned(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/c.jpg'),
                radius: 26.0,
              ),
              left: _width * 0.5 - 26.0,
              bottom: 30.0,
            ),
            Positioned(
              child: Text(
                '男 29 金牛座 ',
                style: TextStyle(color: Colors.white),
              ),
              left: _width * 0.5 - 26.0,
              bottom: .0,
            )
          ],
        ),
      ),
      actions: <Widget>[],
    );

    return Scaffold(
      body: NestedScrollView(
        key: new PageStorageKey<String>('UserDetail'),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: _appBar,
            ),
          ];
        },
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                slivers: <Widget>[
                  new SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => PostDetail(),
                        childCount: 55,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Align(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/c.jpg'),
                radius: 12.0,
              ),
              alignment: Alignment.centerLeft,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '寒云',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text('3小时前'),
                ],
              ),
            ),
            Align(
              child: Icon(
                Icons.thumb_up,
                size: 12.0,
                color: Theme.of(context).primaryColor,
              ),
              alignment: Alignment.centerRight,
            )
          ],
        ),
        Text(
          '  生命里，一些缱绻，无论素净，还是喧哗，都已经被岁月赋予了清喜的味道，一些闲词，或清新，或淡雅，总会在某一个回眸的时刻醉了流年，濡湿了柔软的心，冥冥之中，我们沿着呼唤的风声，终于在堆满落花的秋里，再次重逢，念在天涯，心在咫尺，我相信，一米阳光，才是我们最好的距离。',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Divider(
          indent: 4,
        ),
      ],
    );
  }
}
