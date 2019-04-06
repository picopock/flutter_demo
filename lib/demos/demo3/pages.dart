import 'package:flutter/material.dart';
import './custom_router.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(
            'First Page',
            style: TextStyle(
              fontSize: 56.0,
            ),
          ),
          elevation: 10.0,
        ),
        body: Center(
          child: MaterialButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: () {
              Navigator.of(context).push(CustomRoute(SecondPage()));
            },
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'second page',
          style: TextStyle(
            fontSize: 56.0,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.adjust,
            color: Colors.white,
            size: 36.0,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.airline_seat_flat,
            size: 36,
          ),
        ],
        elevation: 10.0,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
