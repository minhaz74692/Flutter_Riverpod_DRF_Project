# Flutter, RiverPod state management, Django Resr Framework Project.

# Flutter Riverpod State Management Examples

This repository demonstrates various ways to manage state in a Flutter application using **Riverpod**.

## State Management Techniques

### 1. Provider
A `Provider` is used for providing read-only values or objects.

```dart
final stringProvider = Provider<String>((ref) => 'Hello');

final counterProvider = StateProvider<int>((ref) => 0);

final futureProvider = FutureProvider<int>((ref) async {
  return await fetchSomeData();
});

final streamProvider = StreamProvider<int>((ref) => myStream());

final counterNotifierProvider = ChangeNotifierProvider<CounterNotifier>((ref) => CounterNotifier());

final counterNotifier = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

final userProvider = Provider.family<User, int>((ref, userId) => fetchUser(userId));

final autoDisposeProvider = StateProvider.autoDispose<int>((ref) => 0);

