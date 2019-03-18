import 'package:flutter/material.dart';

class ReorderableDemo extends StatefulWidget {
  @override
  _ReorderableDemoState createState() => _ReorderableDemoState();
}

class _ReorderableDemoState extends State<ReorderableDemo> {
  List<String> names = [
    '排序序列号1',
    '排序序列号2',
    '排序序列号3',
    '排序序列号4',
    '排序序列号5',
    '排序序列号6',
    '排序序列号7',
    '排序序列号8',
    '排序序列号9',
    '排序序列号10',
    '排序序列号11',
    '排序序列号12',
    '排序序列号13',
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      children: names.map(_buildCard).toList(),
      onReorder: _onReorder,
    );
  }

  Widget _buildCard(String name) {
    return SizedBox(
      height: 200.0,
      key: ObjectKey(name),
      child: Card(
        color: Colors.red.withOpacity(0.5),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(fontSize: 35.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex = newIndex - 1;
    }
    var name = names.removeAt(oldIndex);
    names.insert(newIndex, name);
    setState(() {});
  }
}
