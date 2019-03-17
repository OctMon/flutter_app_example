import 'package:flutter/material.dart';

class BottomBarDemo extends StatefulWidget {
  @override
  _BottomBarDemoState createState() => _BottomBarDemoState();
}

class _BottomBarDemoState extends State<BottomBarDemo> {
  final List pages = [
    Center(
      child: Text(
        '标签1',
        style: TextStyle(
          fontSize: 35.0,
          color: Colors.black38,
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          '标签2',
          style: TextStyle(
            fontSize: 35.0,
          ),
        ),
      ),
    ),
  ];
  var currentPage;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('去掉水波纹'),
        centerTitle: true,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              currentPage = pages[_currentIndex];
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.screen_share),
                title: Text(
                  '栏目1',
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  '栏目2',
                )),
          ],
        ),
      ),
      body: currentPage,
    );
  }
}
