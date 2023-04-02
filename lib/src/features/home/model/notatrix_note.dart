import 'package:equatable/equatable.dart';

class NotatrixNote extends Equatable {
  final String title;
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
