import 'package:flutter/material.dart';
import 'school_active_detail.dart';
import '../user/user_detail.dart';

typedef ScrollControllerCallback(double position);

class SchoolActive extends StatefulWidget {
  final ScrollControllerCallback callback;
  final double appBarHeight;

  SchoolActive({this.callback, this.appBarHeight = 200.0});

  @override
  State createState() {
    return _SchoolActiveState();
  }
}

class _SchoolActiveState extends State<SchoolActive>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController;
  double _appBarHeight = 200.0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(
        () {
          double _p = _scrollController.position.pixels
              .toDouble()
              .clamp(.0, _appBarHeight);
          if (_p < widget.appBarHeight) {
            if (widget.callback != null) {
              widget.callback(_p);
            }
          }
        },
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      key: new PageStorageKey<String>('SchoolActive'),
      slivers: <Widget>[
        new SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => GestureDetector(
                    child: ActiveDetail(index % 3 == 0),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return SchoolActiveDetail();
                      }));
                    },
                  ),
              childCount: 55,
            ),
          ),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Align(
              child: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/c.jpg'),
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
