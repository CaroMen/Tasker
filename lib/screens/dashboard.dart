import 'package:flutter/material.dart';
import 'package:tasker/services/auth_service.dart';

class DashboardScreen extends StatefulWidget {
  static final String id = 'dashboard';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: FlatButton(
          onPressed: () => AuthService.logout(context),
          child: Text('Log Out'),
        ),
      ),
    );
  }
}
