import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroViewsDemo extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Colors.blueAccent,
      mainImage: Image.asset('assets/airplane.png'),
      iconImageAssetPath: 'assets/air-hostess.png',
      title: Text('机票'),
      body: Text('Haselfree预订机票，取消全额退款'),
    ),
    PageViewModel(
      pageColor: Colors.lightGreen,
      mainImage: Image.asset('assets/hotel.png'),
      iconImageAssetPath: 'assets/waiter.png',
      title: Text('酒店'),
      body: Text('我们为您提供舒适的住宿，享受您在美丽的酒店住宿'),
    ),
    PageViewModel(
      pageColor: Colors.blueGrey,
      mainImage: Image.asset('assets/taxi.png'),
      iconImageAssetPath: 'assets/taxi-driver.png',
      title: Text('出租车'),
      body: Text('通过无现金支付系统轻松预订出租车门口'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      onTapDoneButton: () {
        Navigator.pop(context);
      },
      onTapSkipButton: () {
        Navigator.pop(context);
      },
      skipText: Text('跳过'),
      doneText: Text('完成'),
      pageButtonTextStyles: TextStyle(
        fontSize: 18.0,
        color: Colors.white
      ),
    );
  }
}
