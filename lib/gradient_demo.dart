import 'package:flutter/material.dart';
import 'dart:ui';

class GradientDemo extends StatefulWidget {
  @override
  _GradientDemoState createState() => _GradientDemoState();
}

const _maxOffset = 100;

class _GradientDemoState extends State<GradientDemo> {
  double _opacityValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification &&
                    notification.depth == 0) {
                  _onScroll(notification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Image.network(
                    'https://dpic.tiankong.com/r6/eb/QJ6154840181.jpg?x-oss-process=style/670ws',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.amberAccent,
                    height: 800,
                    child: Text(
                      '渐变AppBar',
                      style: Theme.of(context).textTheme.display2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: _opacityValue,
            child: Container(
              height: MediaQueryData.fromWindow(window).padding.top + kToolbarHeight,
              child: AppBar(
                backgroundColor: Colors.red,
                title: Text(
                  '渐变AppBar',
                ),
                centerTitle: true,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onScroll(offset) {
    double alpha = offset / _maxOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _opacityValue = alpha;
    });
    print(offset);
  }
}
