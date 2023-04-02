import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';

/// class to contain the properties
class HomeState {
  List<NotatrixNote> notes;

  HomeState({required this.notes});

  HomeState copyWith({
    List<NotatrixNote>? notes,
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
    state.notes.add(note);
    state = state.copyWith(notes: state.notes);
  }

  void removeNote(int noteId) {
    state.notes.removeAt(noteId);
    state = state.copyWith(notes: state.notes);
  }

  void updateNote(int noteId, NotatrixNote updatedNote) {
    state.notes[noteId] = updatedNote;
    state = state.copyWith(notes: state.notes);
  }
}

/// exposing the controller using Riverpod
final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
    (ref) => HomeController(HomeState(notes: [])));
