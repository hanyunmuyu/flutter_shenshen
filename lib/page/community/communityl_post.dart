import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../http/HttpClient.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class CommunityPost extends StatefulWidget {
  @override
  State createState() {
    return _CommunityPostState();
  }
}

class _CommunityPostState extends State<CommunityPost> {
  List _imgList = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发布动态'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              FormData formData = new FormData.from(
                {
                  'file[]': List.generate(_imgList.length, (index) {
                    return UploadFileInfo(
                      _imgList[index],
                      _getExtension(_imgList[index].path),
                    );
                  }),
                  'content': _textEditingController.text.toString()
                },
              );
              HttpClient.post(context, '/api/v1/school/post', formData)
                  .then((v) {
                Navigator.maybePop(context);
              });
            },
            child: Text(
              '发布',
              textScaleFactor: 1.2,
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: '输入内容',
                border: OutlineInputBorder(),
              ),
            ),
            _buildImgListWidget(_imgList),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                getImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getExtension(String path) {
    return path.split('/').last;
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
          alignment: Alignment.center,
          child: Text(
            '滑动删除',
            style: TextStyle(color: Colors.red),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: new Image.file(_imgList[index]),
        ),
      );
    });
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: _list,
      ),
    );
  }

  Future getImage() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 100.0,
      maxHeight: 100.0,
    ).then((file) {
      if (file != null) {
        print(file);
        _imgList.add(file);
        setState(() {});
      }
    });
  }
}
