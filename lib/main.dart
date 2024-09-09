import 'package:drf_flutter_app/app.dart';
import 'package:flutter/material.dart';
import 'blocs/di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MyApp(),
  );
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Riverpod State Management',
//       home: WelcomeScreen(),
//     );
//   }
// }

// // 1. Provider
// final greetingProvider = Provider<String>((ref) {
//   return 'Hello, Riverpod!';
// });

// // 2. StateProvider
// final counterProvider = StateProvider<int>((ref) => 0);

// // 3. FutureProvider
// final futureProvider = FutureProvider<String>((ref) async {
//   await Future.delayed(Duration(seconds: 2));
//   return 'Data loaded!';
// });

// // 4. StreamProvider
// Stream<int> numberStream() async* {
//   for (int i = 0; i <= 5; i++) {
//     await Future.delayed(Duration(seconds: 1));
//     yield i;
//   }
// }

// final streamProvider = StreamProvider<int>((ref) => numberStream());

// // 5. ChangeNotifierProvider
// class CounterNotifier extends ChangeNotifier {
//   int _count = 0;
//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners();
//   }
// }

// final counterNotifierProvider = ChangeNotifierProvider<CounterNotifier>(
//   (ref) => CounterNotifier(),
// );

// // 6. StateNotifierProvider
// class NumberNotifier extends StateNotifier<int> {
//   NumberNotifier() : super(0);

//   void increment() {
//     state++;
//   }
// }

// final numberNotifierProvider = StateNotifierProvider<NumberNotifier, int>(
//   (ref) => NumberNotifier(),
// );

// // 7. Provider.family
// final userProvider = Provider.family<String, int>((ref, userId) {
//   return 'User $userId';
// });

// // 8. AutoDispose
// final autoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);

// class WelcomeScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final greeting = ref.watch(greetingProvider);
//     final counter = ref.watch(counterProvider);
//     final futureData = ref.watch(futureProvider);
//     final streamData = ref.watch(streamProvider);
//     final counterNotifier = ref.watch(counterNotifierProvider);
//     final number = ref.watch(numberNotifierProvider);

//     return Scaffold(
//       appBar: AppBar(title: Text('Riverpod State Management')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(greeting),
//             Text('StateProvider Counter: $counter'),
//             ElevatedButton(
//               onPressed: () => ref.read(counterProvider.notifier).state++,
//               child: Text('Increment StateProvider Counter'),
//             ),
//             futureData.when(
//               data: (data) => Text(data),
//               loading: () => CircularProgressIndicator(),
//               error: (error, stack) => Text('Error: $error'),
//             ),
//             streamData.when(
//               data: (data) => Text('Stream Value: $data'),
//               loading: () => CircularProgressIndicator(),
//               error: (error, stack) => Text('Error: $error'),
//             ),
//             Text('ChangeNotifier Counter: ${counterNotifier.count}'),
//             ElevatedButton(
//               onPressed: () => ref.read(counterNotifierProvider.notifier).increment(),
//               child: Text('Increment ChangeNotifier Counter'),
//             ),
//             Text('StateNotifier Counter: $number'),
//             ElevatedButton(
//               onPressed: () => ref.read(numberNotifierProvider.notifier).increment(),
//               child: Text('Increment StateNotifier Counter'),
//             ),
//             Text(ref.watch(userProvider(1))),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(autoDisposeProvider.notifier).state++;
//               },
//               child: Text('Increment AutoDispose Counter'),
//             ),
//             Text('AutoDispose Counter: ${ref.watch(autoDisposeProvider)}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
