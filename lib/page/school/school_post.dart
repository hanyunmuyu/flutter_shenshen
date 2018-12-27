import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/foundation.dart';

class SchoolPost extends StatefulWidget {
  @override
  State createState() {
    return _SchoolPostState();
  }
}

class _SchoolPostState extends State<SchoolPost> {
  List _imgList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              print(_imgList);
            },
            child: Text(
              '发布',
              textScaleFactor: 1.2,
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(),
          _buildImgListWidget(_imgList),
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

  Widget _buildImgListWidget(imgList) {
    List<Widget> _list = List.generate(_imgList.length, (index) {
      return Dismissible(
        key: Key('$index'),
        onDismissed: (direction) {
          //这个和Android的SnackBar差不多
          setState(() {
            _imgList.removeAt(index);
          });
        },
        //如果指定了background 他将会堆叠在Dismissible child后面 并在child移除时暴露
        background: new Container(
          color: Colors.red,
          child: Text('左滑删除'),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: new Image.file(_imgList[index]),
        ),
      );
    });
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: _list,
    );
  }

  Future getImage() async {
    if (_imgList.length > 3) {
      return;
    }
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 100.0,
      maxHeight: 100.0,
    );
    _imgList.add(image);
    print(_imgList.length);
    setState(() {});
  }
}
