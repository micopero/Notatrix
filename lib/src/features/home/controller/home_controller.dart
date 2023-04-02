import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notatrix/src/features/home/data/local/hive_notatrix_notes_box.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';

/// class to contain the properties
class HomeState {
  HiveNotatrixNotesBox notes;

  HomeState({required this.notes});

  HomeState copyWith({
    HiveNotatrixNotesBox? notes,
  }) {
    return HomeState(
      notes: notes ?? this.notes,
    );
  }
}

/// class to do operations on the properties
class HomeController extends StateNotifier<HomeState> {
  HomeController(super.state);

  void addNote(NotatrixNote note) {
    state.notes.addNote(note);
    state = state.copyWith(notes: state.notes);
  }

  void removeNote(int noteId) {
    state.notes.removeNote(noteId);
    state = state.copyWith(notes: state.notes);
  }

  void updateNote(int noteId, NotatrixNote updatedNote) {
    state.notes.updateNote(noteId, updatedNote);
    state = state.copyWith(notes: state.notes);
  }
}

/// exposing the controller using Riverpod
final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  ref.onDispose(() => Hive.close());
  return HomeController(HomeState(notes: HiveNotatrixNotesBox()));
});
