import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notatrix/src/core/constants/notatrix_colors.dart';
import 'package:notatrix/src/core/navigation/notatrix_router.dart';
import 'package:notatrix/src/features/splash/view/widgets/rectangular_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Timer(const Duration(seconds: 3),
          () => context.replaceNamed(NotatrixRoutes.home.name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: NotatrixColors.kBackgroundSecondary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: RectangularContainer(value: "Notatrix"),
            ),
          ),
        ));
  }
}
