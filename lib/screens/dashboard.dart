import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasker/models/user_model.dart';
import 'package:tasker/services/auth_service.dart';
import 'package:tasker/utilities/constants.dart';

class DashboardScreen extends StatefulWidget {
  final String userId;
  DashboardScreen({this.userId});

  static final String id = 'dashboard';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usersRef.document(widget.userId).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        User user = User.fromDoc(snapshot.data);
        return Stack(
          children: <Widget>[
            new Container(
              color: Color(0xFFE9EFEF),
            ),
            new Container(
              color: Color(0xFF5AB1C2), //blue section
              height: MediaQuery.of(context).size.height / 2.93,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 80),
                      child: Text(
                        'Hello, ${user.name}',
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 30.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                  padding: EdgeInsets.only(top: 100),
                  margin: EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: PageView.builder(
                          itemCount: 5,
                          controller: PageController(viewportFraction: 0.55),
                          onPageChanged: (int index) =>
                              setState(() => _index = index),
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
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 280.0, left: 40.0),
                  child: Text(
                    'Tasks',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontSize: 25.0,
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 300.0, left: 10.0, right: 10.0),
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return new Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.album),
                          title: Text('Hello'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
