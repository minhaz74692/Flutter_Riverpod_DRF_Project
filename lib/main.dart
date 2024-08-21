import 'package:drf_flutter_app/constants.dart';
import 'package:drf_flutter_app/repository/dio/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dio POST Request Example')),
        body: PostRequestDemo(),
      ),
    );
  }
}

class PostRequestDemo extends StatefulWidget {
  @override
  _PostRequestDemoState createState() => _PostRequestDemoState();
}

class _PostRequestDemoState extends State<PostRequestDemo> {
  String responseMessage = 'Response will be shown here';

  void makePostRequest() async {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(responseMessage),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: makePostRequest,
            child: Text('Make POST Request'),
          ),
        ],
      ),
    );
  }
}
