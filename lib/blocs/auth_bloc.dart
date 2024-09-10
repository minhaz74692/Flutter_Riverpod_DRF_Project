import 'package:drf_flutter_app/models/user_model.dart';
import 'package:drf_flutter_app/repository/repos/auth_repo.dart';
import 'package:drf_flutter_app/repository/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'di_container.dart' as di;

final authPod = ChangeNotifierProvider<AuthBloc>(
  (ref) {
    return di.sl<AuthBloc>();
  },
);

class AuthBloc extends ChangeNotifier {
  final AuthRepo authRepo;
  final SharedPreferences sp;
  AuthBloc({required this.authRepo, required this.sp});

  UserModel? _user;
  UserModel? get user => _user;

  Future<bool> logIn() async {
    ApiResponse response = await authRepo.loginRepo();
    if (response.response.statusCode == 200) {
      var responseData = response.response.data;
      _user = UserModel.fromJson(responseData["user_data"]);

      notifyListeners();
      authRepo.saveUserToken(user!.token ?? '');
      return true;
    } else {
      _user = null;
      notifyListeners();
      return false;
    }
  }

  //Get Users List
  Future<bool> getUsers() async {
    ApiResponse response = await authRepo.getUsersRepo();
    if (response.response.statusCode == 200) {
      var responseData = response.response.data;
      // _user = UserModel.fromJson(responseData["user_data"]);s

      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  int _counter = 0;
  int get counter => _counter;
  changeCounter(bool increase) {
    increase ? _counter++ : _counter--;
    notifyListeners();
  }
}
