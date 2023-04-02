import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({
    super.key,
    this.onTap,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
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
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border(
                  top: BorderSide(width: 10, color: Colors.grey),
                  right: BorderSide(width: 10, color: Colors.grey),
                  left: BorderSide(width: 10, color: Colors.grey),
                  bottom: BorderSide(width: 10, color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 3.h)),
                  const Divider(thickness: 2),
                  Text(body, maxLines: 5, style: TextStyle(fontSize: 1.9.h)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
