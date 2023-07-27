import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:igclone_flutter/screens/home.dart';
import 'package:igclone_flutter/screens/login.dart';
import 'package:igclone_flutter/state/auth/models/auth_result.dart';
import 'package:igclone_flutter/state/auth/providers/auth_state_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey,
        ),
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Consumer(builder: (context, ref, child) {
          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;
          isLoggedIn.log();
          return isLoggedIn ? const MainView() : const LoginView();
        }));
  }
}
