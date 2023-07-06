import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dart:developer' as devtools show log;

import '../state/auth/providers/auth_state_provider.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Instagram Clone',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 40,
              ),
              // header text
              Center(
                child: Text(
                  'Welcome to Instagram Clone',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Text(
                'Please log in to continue',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(height: 1.5),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: const Color.fromARGB(255, 66, 162, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                // onPressed navigator push MainView from home.dart
                onPressed:
                    ref.read(authStateProvider.notifier).loginWithFacebook,
                child: Text(
                  'Facebook',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  backgroundColor: Color.fromARGB(255, 217, 101, 93),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: ref.read(authStateProvider.notifier).loginWithGoogle,
                child: Text(
                  'Google',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
