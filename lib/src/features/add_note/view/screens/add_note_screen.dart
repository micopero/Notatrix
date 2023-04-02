import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notatrix/src/core/constants/notatrix_colors.dart';
import 'package:notatrix/src/features/home/controller/home_controller.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';
import 'package:notatrix/src/shared/view/widgets/input_field.dart';
import 'package:notatrix/src/shared/view/widgets/notatrix_button.dart';
import 'package:sizer/sizer.dart';

class AddNoteScreen extends ConsumerStatefulWidget {
  const AddNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends ConsumerState<AddNoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  // on confirm pressed
  void _confirmAction(BuildContext context) {
    String title = titleController.text;
    String body = bodyController.text;

    if (title.isNotEmpty && body.isNotEmpty) {
      final homeController = ref.read(homeControllerProvider.notifier);
      NotatrixNote note = NotatrixNote(title: title, body: body);
      homeController.addNote(note);
      context.pop();
    }
  }

  // on cancel pressed
  void _cancelAction(BuildContext context) {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NotatrixColors.kBackgroundPrimary,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              InputField(
                hintText: "Title",
                controller: titleController,
              ),
              SizedBox(height: 2.h),
              InputField(
                hintText: "Body",
                maxLines: 3.5.h.toInt(),
                controller: bodyController,
              ),
              SizedBox(height: 2.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                NotatrixButton(
                    label: "Confirm", onPressed: () => _confirmAction(context)),
                NotatrixButton(
                  label: "Cancel",
                  onPressed: () => _cancelAction(context),
                  backgroundColor: NotatrixColors.kTextFieldErrorBorder,
                ),
              ]),
            ],
          ),
        )),
      ),
    );
  }
}
