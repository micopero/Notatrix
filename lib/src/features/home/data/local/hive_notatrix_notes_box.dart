import 'package:hive_flutter/adapters.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';

class HiveNotatrixNotesBox {
  final box = Hive.box<NotatrixNote>("notatrix_notes");

  int getLength() {
    return box.length;
  }

  List<NotatrixNote> getAllNotes() {
    List<NotatrixNote> notesList = [];
    for (NotatrixNote note in box.values) {
      notesList.add(note);
    }
    return notesList;
  }

  NotatrixNote? getNote(int index) {
    return box.getAt(index);
  }

  void addNote(NotatrixNote note) {
    box.add(note);
  }

  void updateNote(int index, NotatrixNote updatedNote) {
    box.putAt(index, updatedNote);
  }

  void removeNote(int index) {
    box.deleteAt(index);
  }
}
