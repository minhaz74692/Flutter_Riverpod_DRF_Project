import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:drf_flutter_app/screens/new_screen.dart';
import 'package:drf_flutter_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Counter provider
final counterProvider = StateProvider<int>((ref) => 4);
final nameProvider = StateProvider<String>((ref) => "");

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  String responseMessage = 'Response will be shown here';

  // ProviderContainer refContainer = ProviderContainer();
  void makePostRequest() async {
    // var ab = refContainer.read(authPod);
    var ab = ref.read(authPod);
    await ab.logIn().then((status) {
      status ? Helper.nextScreenCloseOthers(context, TestScreen()) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio POST Request Example')),
      body: Consumer(builder: (context, ref, child) {
        final ap = ref.watch(authPod);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(responseMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: makePostRequest,
                child: const Text('Log In'),
              ),
              const SizedBox(height: 20),
              ap.user != null ? Text(ap.user!.email!) : SizedBox.shrink(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ap.changeCounter(false);
                    },
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 20),
                  Text(ap.counter.toString()),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      ap.changeCounter(true);
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return TestScreen();
                      },
                    ),
                  );
                },
                child: const Icon(Icons.arrow_right),
              ),
            ],
          ),
        );
      }),
    );
  }
}
