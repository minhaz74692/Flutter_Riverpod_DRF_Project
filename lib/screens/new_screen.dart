import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:drf_flutter_app/screens/welcome.dart';
import 'package:drf_flutter_app/screens/service_bloc.dart';
import 'package:drf_flutter_app/services/sp_service.dart';
import 'package:drf_flutter_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final serviceBloc = ServiceBloc();

    return Scaffold(
      appBar: AppBar(title: Text('Counter Example')),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Print the counter value
                    serviceBloc.printCounter(ref);
                    ref.read(counterProvider.notifier).state++;
                    ref.read(nameProvider.notifier).state = "Minhazul Islam";
                  },
                  child: Text('Print Counter'),
                ),
                Text(ref.watch(counterProvider).toString()),
                Text(ref.watch(nameProvider)),
                ElevatedButton(
                  onPressed: () async {
                    ref.read(authPod).getUsers();
                  },
                  child: Text('Get Users'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await SpServices.removeKey(SpServices.userToken);
                    Helper.nextScreenCloseOthers(context, WelcomeScreen());
                  },
                  child: Text('Log Out'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
