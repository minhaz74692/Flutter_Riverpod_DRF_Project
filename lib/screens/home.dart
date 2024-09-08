import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String responseMessage = 'Response will be shown here';

  // ProviderContainer refContainer = ProviderContainer();
  void makePostRequest() async {
    // var ab = refContainer.read(authPod);
    var ab = ref.read(authPod);
    await ab.logIn();
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
                child: const Text('Make POST Request'),
              ),
              const SizedBox(height: 20),
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
            ],
          ),
        );
      }),
    );
  }
}
