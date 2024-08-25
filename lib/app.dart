import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'di_container.dart' as di;

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<AuthBloc>()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Dio POST Request Example')),
          body: PostRequestDemo(),
        ),
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

  void makePostRequest() async {
    var ab = context.read<AuthBloc>();
    await ab.logIn();
  }

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
