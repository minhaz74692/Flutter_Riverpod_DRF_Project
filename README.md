# Flutter, RiverPod state management, Django Resr Framework Project.

# Flutter Riverpod State Management Examples

This repository demonstrates various ways to manage state in a Flutter application using **Riverpod**.

## State Management Techniques with RiverPod

```dart
// 1. Provider
// A `Provider` is used for providing read-only values or objects.
final stringProvider = Provider<String>((ref) => 'Hello');

// 2. StateProvider
// A StateProvider is used for managing simple mutable states.
final counterProvider = StateProvider<int>((ref) => 0);


// 3. FutureProvider
// A FutureProvider is used for managing asynchronous data, such as API calls.
final futureProvider = FutureProvider<int>((ref) async {
  return await fetchSomeData();
});

// 4. StreamProvider
// A StreamProvider is used to handle streams.
final streamProvider = StreamProvider<int>((ref) => myStream());

// 5. ChangeNotifierProvider
// A ChangeNotifierProvider is used for state management with ChangeNotifier.
final counterNotifierProvider = ChangeNotifierProvider<CounterNotifier>((ref) => CounterNotifier());

// 6. StateNotifierProvider
// A StateNotifierProvider is for more advanced state management using StateNotifier.
final counterNotifier = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

// 7. Provider.family
// A Provider.family allows you to create parameterized providers.
final userProvider = Provider.family<User, int>((ref, userId) => fetchUser(userId));


// Example Fluter App with all possible Riverpod state management methods
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod State Management',
      home: WelcomeScreen(),
    );
  }
}

// 1. Provider
final greetingProvider = Provider<String>((ref) {
  return 'Hello, Riverpod!';
});

// 2. StateProvider
final counterProvider = StateProvider<int>((ref) => 0);

// 3. FutureProvider
final futureProvider = FutureProvider<String>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded!';
});

// 4. StreamProvider
Stream<int> numberStream() async* {
  for (int i = 0; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

final streamProvider = StreamProvider<int>((ref) => numberStream());

// 5. ChangeNotifierProvider
class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

final counterNotifierProvider = ChangeNotifierProvider<CounterNotifier>(
  (ref) => CounterNotifier(),
);

// 6. StateNotifierProvider
class NumberNotifier extends StateNotifier<int> {
  NumberNotifier() : super(0);

  void increment() {
    state++;
  }
}

final numberNotifierProvider = StateNotifierProvider<NumberNotifier, int>(
  (ref) => NumberNotifier(),
);

// 7. Provider.family
final userProvider = Provider.family<String, int>((ref, userId) {
  return 'User $userId';
});

// 8. AutoDispose
final autoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);

class WelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);
    final counter = ref.watch(counterProvider);
    final futureData = ref.watch(futureProvider);
    final streamData = ref.watch(streamProvider);
    final counterNotifier = ref.watch(counterNotifierProvider);
    final number = ref.watch(numberNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod State Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greeting),
            Text('StateProvider Counter: $counter'),
            ElevatedButton(
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: Text('Increment StateProvider Counter'),
            ),
            futureData.when(
              data: (data) => Text(data),
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            streamData.when(
              data: (data) => Text('Stream Value: $data'),
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            Text('ChangeNotifier Counter: ${counterNotifier.count}'),
            ElevatedButton(
              onPressed: () => ref.read(counterNotifierProvider.notifier).increment(),
              child: Text('Increment ChangeNotifier Counter'),
            ),
            Text('StateNotifier Counter: $number'),
            ElevatedButton(
              onPressed: () => ref.read(numberNotifierProvider.notifier).increment(),
              child: Text('Increment StateNotifier Counter'),
            ),
            Text(ref.watch(userProvider(1))),
            ElevatedButton(
              onPressed: () {
                ref.read(autoDisposeProvider.notifier).state++;
              },
              child: Text('Increment AutoDispose Counter'),
            ),
            Text('AutoDispose Counter: ${ref.watch(autoDisposeProvider)}'),
          ],
        ),
      ),
    );
  }
}


// 8. AutoDispose
// You can use the autoDispose modifier to automatically dispose of a provider when it's no longer needed.
final autoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);

