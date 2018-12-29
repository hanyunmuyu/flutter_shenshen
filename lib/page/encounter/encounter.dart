import 'package:flutter/material.dart';

class Encounter extends StatefulWidget {
  @override
  State createState() {
    return _EncounterState();
  }
}

class _EncounterState extends State<Encounter> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('遇见'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            child: Container(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                children: <String>[
                  'images/c.jpg',
                  'images/lf.jpg',
                  'images/c.jpg',
                  'images/c.jpg',
                  'images/c.jpg',
                  'images/lf.jpg',
                ]
                    .map<Widget>(
                      (String url) => GridTile(
                            footer: GridTileBar(title: Text(url)),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(url),
                            ),
                          ),
                    )
                    .toList(),
              ),
              width: _width,
              height: _width / 3 * 2,
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
