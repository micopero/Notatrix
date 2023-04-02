import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({
    super.key,
    this.child,
    this.borderColor = Colors.black38,
    this.onTap,
  });

  final Widget? child;
  final Color borderColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SizedBox(
        height: 32.h,
        width: 32.h,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border(
                  top: BorderSide(width: 10, color: borderColor),
                  right: BorderSide(width: 10, color: borderColor),
                  left: BorderSide(width: 10, color: borderColor),
                  bottom: BorderSide(width: 10, color: borderColor)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
