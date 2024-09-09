import 'package:drf_flutter_app/blocs/auth_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ServiceBloc {
  printCounter(WidgetRef ref) {
    // Access the counter value from authPod
    final counterValue = ref.read(authPod).counter;
    print('Counter value: $counterValue');
  }
}
