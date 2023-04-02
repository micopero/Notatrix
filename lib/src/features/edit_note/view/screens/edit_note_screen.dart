import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notatrix/src/core/constants/notatrix_colors.dart';
import 'package:notatrix/src/features/home/controller/home_controller.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';
import 'package:notatrix/src/shared/view/widgets/input_field.dart';
import 'package:notatrix/src/shared/view/widgets/notatrix_button.dart';
import 'package:sizer/sizer.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  const EditNoteScreen({super.key, required this.noteId});

  final int noteId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends ConsumerState<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void initState() {
    // Do not use "watch" in initState, use "read"
    final homeControllerState = ref.read(homeControllerProvider);
    final initialTitle =
        homeControllerState.notes.getNote(widget.noteId)!.title;
    final initialBody = homeControllerState.notes.getNote(widget.noteId)!.body;
    titleController = TextEditingController(text: initialTitle);
    bodyController = TextEditingController(text: initialBody);
    super.initState();
  }

  // on confirm pressed
  void _confirmAction(BuildContext context) {
    final homeControllerState = ref.read(homeControllerProvider);
    final initialTitle =
        homeControllerState.notes.getNote(widget.noteId)!.title;
    final initialBody = homeControllerState.notes.getNote(widget.noteId)!.body;
    String title = titleController.text;
    String body = bodyController.text;

    if (title == initialTitle && body == initialBody) {
      context.pop();
    } else if (title.isNotEmpty && body.isNotEmpty) {
      final homeController = ref.read(homeControllerProvider.notifier);
      NotatrixNote updatedNote = NotatrixNote(title: title, body: body);
      homeController.updateNote(widget.noteId, updatedNote);
      context.pop();
    }
  }

  // on cancel pressed
  void _deleteAction(BuildContext context) {
    final homeController = ref.read(homeControllerProvider.notifier);
    homeController.removeNote(widget.noteId);
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
                  label: "Delete",
                  onPressed: () => _deleteAction(context),
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
