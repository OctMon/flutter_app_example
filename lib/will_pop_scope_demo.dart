import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  final String title;

  WillPopScopeDemo({Key key, @required this.title}) : super(key: key);

  @override
  _WillPopScopeDemoState createState() => _WillPopScopeDemoState();
}

class _WillPopScopeDemoState extends State<WillPopScopeDemo> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.display2,
            ),
          ),
        ));
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("你确定要退出吗？"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text("是"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("否"),
              ),
            ],
          ),
    );
  }
}
