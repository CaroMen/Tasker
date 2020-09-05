import 'package:flutter/material.dart';
import 'package:tasker/services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  static final String id = 'dashboard';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          color: Color(0xFFE9EFEF),
        ),
        new Container(
          color: Color(0xFF5AB1C2), //blue section
          height: MediaQuery.of(context).size.height / 2.93,
        ),
        new Container(
          padding: EdgeInsets.only(top: 100),
          margin: EdgeInsets.only(left: 30),
          child: SizedBox(
            height: 250,
            width: 400,
            child: PageView.builder(
              itemCount: 5,
              controller: PageController(viewportFraction: 0.55),
              onPageChanged: (int index) => setState(() => _index = index),
              itemBuilder: (_, i) {
                return Transform.scale(
                  scale: i == _index ? 1 : 0.9,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
