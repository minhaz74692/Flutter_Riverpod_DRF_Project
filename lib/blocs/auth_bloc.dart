import 'package:drf_flutter_app/repository/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di_container.dart' as di;

final authPod = ChangeNotifierProvider<AuthBloc>((ref) {
  return di.sl<AuthBloc>();
});

class AuthBloc extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo});

  logIn() async {
    await authRepo.loginRepo();
  }

  int _counter = 0;
  int get counter => _counter;
  changeCounter(bool increase) {
    increase ? _counter++ : _counter--;
    notifyListeners();
  }
}
