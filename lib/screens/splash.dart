// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drf_flutter_app/screens/welcome.dart';
import 'package:drf_flutter_app/screens/new_screen.dart';
import 'package:drf_flutter_app/services/sp_service.dart';
import 'package:drf_flutter_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  String profileImage = "";
  bool connection = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // Center(
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(50),
          //     child: Image.asset(
          //       AppConstant.splashIcon,
          //       height: 200,
          //       width: 200,
          //     ),
          //   ),
          // ),
          child: Text(
            "This is Flutter + RiverPod + DRF project",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          // SizedBox(
          //   height: 12,
          // ),
        ),
      ),
    );
  }

  void navigate() async {
    debugPrint(await SpServices.getString(SpServices.userToken));
    String? isSignedIn = await SpServices.getString(SpServices.userToken);

    Future.delayed(const Duration(milliseconds: 1500)).then((value) async {
      if (isSignedIn != null) {
        Helper.nextScreenCloseOthers(context, TestScreen());
      } else {
        Helper.nextScreenCloseOthers(
          context,
          WelcomeScreen(),
        );
      }
    });
  }
}
