import 'package:flutter/material.dart';

class SchoolActiveDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: SafeArea(
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: new PageStorageKey<String>('SchoolActive'),
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: ActiveDetail(true),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) =>
                                GestureDetector(
                                  child: ActiveDetail(false),
                                  onTap: () {},
                                ),
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
    );
  }
}

class ActiveDetail extends StatelessWidget {
  final bool hasPic;

  ActiveDetail(this.hasPic);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/c.jpg'),
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
            height: 280.0,
            alignment: Alignment.center,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
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
