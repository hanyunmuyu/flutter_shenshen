import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class SchoolPost extends StatefulWidget {
  @override
  State createState() {
    return _SchoolPostState();
  }
}

class _SchoolPostState extends State<SchoolPost> {
  List _imgList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text('发布'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _imgList,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              getImage();
            },
          ),
        ],
      ),
    );
  }

  Future getImage() async {
    if (_imgList.length > 3) {
      return;
    }
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 80.0,
      maxHeight: 80.0,
    );

    setState(() {
      _imgList.add(new Image.file(image));
      _imgList.reversed;
    });
  }
}
