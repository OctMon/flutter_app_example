import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RefreshDemo extends StatefulWidget {
  @override
  _RefreshDemoState createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {
  List<String> _images;
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _images = List<String>();
    _controller = ScrollController();
    _ten();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _ten();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            Duration(seconds: 3),
          );
          _images.clear();
          _ten();
        },
        child: ListView.builder(
          controller: _controller,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Container(
              child: Image.network(
                _images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

  void _ten() {
    for (int i = 0; i < 10; i++) {
      _value();
    }
  }

  void _value() async {
    final response = await http.get(
      'http://dog.ceo/api/breeds/image/random',
    );
    if (response.statusCode == 200) {
      setState(() {
        _images.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('图片加载失败');
    }
  }
}
