import 'package:flutter/material.dart';
import '../user/user_detail.dart';

class SchoolActiveDetail extends StatelessWidget {
  final ScrollController _controller = ScrollController()
    ..addListener(() {
      print(111);
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    controller: _controller,
                    key: new PageStorageKey<String>('SchoolActiveDetail'),
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: ActiveDetail(true),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) => PostDetail(),
                            childCount: 55,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
                hintText: '说点什么',
                suffix: FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text('发布'),
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
        key: Key('schoolActiveDetail'),
        child: Icon(Icons.arrow_upward),
        mini: true,
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
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/c.jpg'),
                  radius: 12.0,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UserDetail();
                  }));
                },
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

class ActiveDetail extends StatelessWidget {
  final bool hasPic;

  ActiveDetail(this.hasPic);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/c.jpg'),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return UserDetail();
                }));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
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
              child: Icon(Icons.more_vert),
              alignment: Alignment.centerRight,
            )
          ],
        ),
        Text(
          '  生命里，一些缱绻，无论素净，还是喧哗，都已经被岁月赋予了清喜的味道，一些闲词，或清新，或淡雅，总会在某一个回眸的时刻醉了流年，濡湿了柔软的心，冥冥之中，我们沿着呼唤的风声，终于在堆满落花的秋里，再次重逢，念在天涯，心在咫尺，我相信，一米阳光，才是我们最好的距离。',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Offstage(
          offstage: !hasPic,
          child: Container(
            height: _width / 3 * 2 + 10,
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
        Align(
          child: GestureDetector(
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
          alignment: Alignment.centerLeft,
        ),
        Divider(
          indent: 4,
        ),
      ],
    );
  }
}
