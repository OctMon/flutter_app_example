import 'package:flutter/material.dart';

class DeleteListViewItemDemo extends StatefulWidget {
  @override
  _DeleteListViewItemDemoState createState() => _DeleteListViewItemDemoState();
}

class _DeleteListViewItemDemoState extends State<DeleteListViewItemDemo> {
  List<String> _list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = List.generate(
      10,
      (index) => '标签${index}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(_list[index]),
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    alignment: Alignment.centerRight,
                      child: Text(
                    '删除',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${_list[index]}  => 已删除'),
                      action: SnackBarAction(label: '确定', onPressed: () {}),
                    ),
                  );
                  _list.removeAt(index);
                });
              },
              child: ListTile(title: Text('${_list[index]}')),
            );
          }),
    );
  }
}
