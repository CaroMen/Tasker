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
              color: Color(0xFFF4F6FD),
            ),
            new Container(
              color: Color(0xFFF4F6FD), //blue section
              height: MediaQuery.of(context).size.height / 2.93,
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(top: 80, left: 20),
                      child: Text(
                        'Hello, ${user.name}!',
                        style: TextStyle(
                          fontFamily: 'Barlow',
                          fontSize: 30.0,
                          color: Color(0xFF020417),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(-50.0, -80.0, 0.0),
                  padding: EdgeInsets.only(top: 100),
                  margin: EdgeInsets.only(left: 10),
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
                              scale: i == _index ? 1 : 1,
                              child: Card(
                                color: Color(0xFF0A155A),
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
                  padding: const EdgeInsets.only(top: 310.0, left: 40.0),
                  child: Text(
                    'YOUR TASKS',
                    style: TextStyle(
                      fontFamily: 'Barlow',
                      fontSize: 15.0,
                      color: Color(0XFF020417),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 320.0, left: 40.0, right: 40.0),
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return new Card(
                    color: Color(0xFF0A155A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.radio_button_unchecked,
                            color: Color(0xFFD103FC),
                          ),
                          title: Text(
                            'Hello',
                            style: TextStyle(
                              fontFamily: 'Barlow',
                              fontSize: 15.0,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
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
