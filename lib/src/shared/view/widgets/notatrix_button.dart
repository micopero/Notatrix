import 'package:flutter/material.dart';
import 'package:notatrix/src/core/constants/notatrix_colors.dart';
import 'package:sizer/sizer.dart';

class NotatrixButton extends StatelessWidget {
  const NotatrixButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor = Colors.blue,
  });

  final String label;
  final Color backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 11.h,
        width: 23.5.h,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(backgroundColor)),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              color: NotatrixColors.kBackgroundSecondary.withOpacity(0.9),
              fontSize: 3.h,
            ),
          ),
        ));
  }
}
