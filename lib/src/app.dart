import 'package:flutter/material.dart';
import 'package:notatrix/src/core/navigation/notatrix_router.dart';
import 'package:sizer/sizer.dart';

class Notatrix extends StatelessWidget {
  const Notatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        title: 'Notatrix',
        routerConfig: NotatrixRouter().router,
      );
    });
  }
}
