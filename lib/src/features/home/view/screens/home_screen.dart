import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notatrix/src/core/constants/notatrix_colors.dart';
import 'package:notatrix/src/core/navigation/notatrix_router.dart';
import 'package:notatrix/src/features/home/controller/home_controller.dart';
import 'package:notatrix/src/features/home/view/widgets/bordered_button.dart';
import 'package:notatrix/src/features/home/view/widgets/note_button.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeControllerState = ref.watch(homeControllerProvider);
    return Scaffold(
      backgroundColor: NotatrixColors.kBackgroundPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: homeControllerState.notes.length + 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              if (index == homeControllerState.notes.length) {
                return const AddNoteButton();
              } else {
                return NoteButton(
                  title: homeControllerState.notes[index].title,
                  body: homeControllerState.notes[index].body,
                  onTap: () => context.pushNamed(NotatrixRoutes.editNote.name,
                      params: {'noteId': index.toString()}),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class AddNoteButton extends ConsumerWidget {
  const AddNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BorderedButton(
      borderColor: Colors.grey,
      onTap: () => context.pushNamed(NotatrixRoutes.addNote.name),
      child: Icon(Icons.add, color: Colors.grey, size: 10.h),
    );
  }
}
