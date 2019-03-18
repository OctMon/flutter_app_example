import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Chip(
              label: Text('选择的标签'),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('01'),
              ),
              onDeleted: () {},
            ),
          ),
          Builder(
            builder: (context) {
              return Center(
                child: ActionChip(
                  label: Text('ACTION CHIP'),
                  onPressed: () {
                    setState(() {
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text('ON TAP'), action: SnackBarAction(label: '确定', onPressed: (){}),));
                    });
                  },
                ),
              );
            },
          ),
          FilterChip(
            label: Text('文字'),
            selected: _isSelected,
            selectedColor: Colors.blue,
            onSelected: (isSelected) {
              setState(() {
                _isSelected = isSelected;
              });
            },
          ),
        ],
      ),
    );
  }
}
