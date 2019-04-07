import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HTTPRequest extends StatefulWidget {
  @override
  _HTTPRequestState createState() => _HTTPRequestState();
}

class _HTTPRequestState extends State<HTTPRequest> {
  String _weatherData = '';

  @override
  void initState() {
    super.initState();
    _getWeatherData();
  }

  Future<Null> _getWeatherData() async {
    Response response;
    Dio dio = Dio();
    response =
        await dio.get('https://api.gugudata.com/weather/weatherinfo/demo');
    setState(() {
      _weatherData = response.data.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dio 网络请求'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Text(_weatherData),
      ),
    );
  }
}
