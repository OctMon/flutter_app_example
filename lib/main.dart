import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'textfields_focus_demo.dart';
import 'will_pop_scope_demo.dart';
import 'refresh_demo.dart';
import 'delete_listview_Item_demo.dart';
import 'widget_to_image_demo.dart';
import 'bottom_bar_demo.dart';
import 'overlay_demo.dart';
import 'intro_views_demo.dart';
import 'reorderable_demo.dart';
import 'chip_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData.dark(),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final double _height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter实用例子")),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: _height * 11.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListView(
                  itemExtent: _height,
                  children: <Widget>[
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: '工作实用例子1\n'),
                                TextSpan(
                                  text: "http://www.flutterj.com/?post=79",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          height: _height,
                        ),
                      ),
                      onTap: () {
                        _launchURL('http://www.flutterj.com/?post=79');
                      },
                    ),
                    _listTile(context, '01 登陆界面TextField的焦点及动作',
                        TextFieldFocusDemo()),
                    _listTile(context, '02 03 04 chip标签系列系列第一个', ChipDemo()),
                    _listTile(context, '05 返回或退出时弹出提示信息',
                        WillPopScopeDemo(title: '返回或退出时弹出提示信息')),
                    _listTile(context, '06 07 实现http接口图片加载', RefreshDemo()),
                    _listTile(context, '08 左滑删除ListView中Item',
                        DeleteListViewItemDemo()),
                    _listTile(
                        context, '09 Widget转化为Image截屏操作', WidgetToImageDemo()),
                    _listTile(context, '10 去掉水波纹的底部导航栏编写', BottomBarDemo()),
                    _listTile(context, '11 弹出widget覆盖原界面并设定时间', OverlayDemo()),
                    _listTile(context, '12 常用APP多屏开场介绍页面制作', IntroViewsDemo()),
                    _listTile(context, '13 拖动方式重新排序项目序列号 ', ReorderableDemo()),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, String title, Widget widget) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Colud not launch $url';
    }
  }
}
