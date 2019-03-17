import 'package:flutter/material.dart';

class OverlayDemo extends StatefulWidget {
  @override
  _OverlayDemoState createState() => _OverlayDemoState();
}

class _OverlayDemoState extends State<OverlayDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '点下面看美女',
          style: TextStyle(fontSize: 36),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOverlay(),
        child: Icon(Icons.zoom_in),
      ),
    );
  }

  void _showOverlay() async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Center(
        child: Container(
          height: 500.0,
          width: 300.0,
          child: Image.network(
            'https://s9.rr.itc.cn/r/wapChange/20164_19_11/a26nda287933407855.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );
    });
    overlayState.insert(overlayEntry);
    await Future.delayed(
      Duration(seconds: 5),
    );
    overlayEntry.remove();
  }
}
