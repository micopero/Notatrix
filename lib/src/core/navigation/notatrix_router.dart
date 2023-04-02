import 'package:go_router/go_router.dart';
import 'package:notatrix/src/features/add_note/view/screens/add_note_screen.dart';
import 'package:notatrix/src/features/edit_note/view/screens/edit_note_screen.dart';
import 'package:notatrix/src/features/home/view/screens/home_screen.dart';
import 'package:notatrix/src/features/splash/view/screens/splash_screen.dart';

enum NotatrixRoutes {
  splash,
  home,
  addNote,
  editNote,
}

class NotatrixRouter {
  late final GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: <GoRoute>[
      GoRoute(
          name: NotatrixRoutes.home.name,
          path: "/home",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              name: NotatrixRoutes.addNote.name,
              path: "addNote",
              builder: (context, state) => const AddNoteScreen(),
            ),
            GoRoute(
              name: NotatrixRoutes.editNote.name,
              path: "editNote/:noteId",
              builder: (context, state) {
                final noteId = int.parse(state.params['noteId']!);
                return EditNoteScreen(noteId: noteId);
              },
            ),
          ]),
      GoRoute(
        name: NotatrixRoutes.splash.name,
        path: "/splash",
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
