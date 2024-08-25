import 'package:drf_flutter_app/repository/repos/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthBloc extends ChangeNotifier {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo});

  logIn() async {
    await authRepo.loginRepo();
  }
}
