import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notatrix/src/app.dart';
import 'package:notatrix/src/features/home/model/notatrix_note.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive
  await Hive.initFlutter();
  Hive.registerAdapter(NotatrixNoteAdapter());
  await Hive.openBox<NotatrixNote>("notatrix_notes");

  runApp(const ProviderScope(child: Notatrix()));
}
