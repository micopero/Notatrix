import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';

part "notatrix_note.g.dart";

@HiveType(typeId: 0)
class NotatrixNote extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;

  const NotatrixNote({required this.title, required this.body});

  NotatrixNote copyWith({
    String? title,
    String? body,
  }) {
    return NotatrixNote(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [];
}
