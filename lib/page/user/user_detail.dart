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
            Align(
              child: Text(
                '男    河南工业大学',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          onPressed: () {
            print('发私信');
          },
        ),
      ],
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
                        (BuildContext context, int index) =>
                            UserPostDetail(index % 2 == 0),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite_border),
        tooltip: '关注',
        key: Key('UserDetail'),
      ),
    );
  }
}

class UserPostDetail extends StatelessWidget {
  final bool hasPic;

  UserPostDetail(this.hasPic);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          '  生命里，一些缱绻，无论素净，还是喧哗，都已经被岁月赋予了清喜的味道，一些闲词，或清新，或淡雅，总会在某一个回眸的时刻醉了流年，濡湿了柔软的心，冥冥之中，我们沿着呼唤的风声，终于在堆满落花的秋里，再次重逢，念在天涯，心在咫尺，我相信，一米阳光，才是我们最好的距离。',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Offstage(
          offstage: !hasPic,
          child: Container(
            height: 280.0,
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              physics: ClampingScrollPhysics(),
              children: <String>[
                'images/c.jpg',
                'images/lf.jpg',
                'images/c.jpg',
                'images/c.jpg',
                'images/c.jpg',
                'images/lf.jpg',
              ]
                  .map<Widget>((String url) => GridTile(
                        footer: GridTileBar(title: Text(url)),
                        child: Image.asset(url, fit: BoxFit.cover),
                      ))
                  .toList(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.thumb_up,
                    size: 12.0,
                    color: hasPic ? Theme.of(context).primaryColor : null,
                  ),
                  Divider(
                    indent: 4,
                  ),
                  Text('111')
                ],
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.comment,
                    size: 12.0,
                  ),
                  Divider(
                    indent: 4,
                  ),
                  Text('111')
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
        Divider(
          indent: 4,
        ),
      ],
    );
  }
}
