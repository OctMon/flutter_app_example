import 'package:flutter/material.dart';

class SingleScreenDemo extends StatefulWidget {
  @override
  _SingleScreenDemoState createState() => _SingleScreenDemoState();
}

class _SingleScreenDemoState extends State<SingleScreenDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countDown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
        'http://img.wxcha.com/file/201606/30/1978c43117.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  void _countDown() {
    Future.delayed(Duration(seconds: 3), _newPage);
  }

  void _newPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SingleScreenNewPage()));
  }
}

class SingleScreenNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(
        '新页面',
        style: Theme.of(context).textTheme.display2,
      )),
    );
  }
}
