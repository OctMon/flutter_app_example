import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetToImageDemo extends StatefulWidget {
  @override
  _WidgetToImageDemoState createState() => _WidgetToImageDemoState();
}

class _WidgetToImageDemoState extends State<WidgetToImageDemo> {
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: AppBar(title: Text('界面转图片'),),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 500.0,
                child: Image.network(
                  'http://www.flutterj.com/content/templates/emlog_dux/images/random/1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 500.0,
                child: Image.network(
                  'http://www.flutterj.com/content/templates/emlog_dux/images/random/2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 500.0,
                child: Image.network(
                  'http://www.flutterj.com/content/templates/emlog_dux/images/random/3.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _capturePng,
          child: Icon(Icons.fullscreen),
        ),
      ),
    );
  }

  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(
        pixelRatio: 3.0,
      );
      ByteData byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List unit8list = byteData.buffer.asUint8List();

      setState(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('查看页面'),
              centerTitle: true,
            ),
            body: ListView(
              children: <Widget>[
                Image.memory(
                  unit8list,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          );
        }));
        return unit8list;
      });
    } catch (e) {
      print(e);
    }
    return null;
  }
}
