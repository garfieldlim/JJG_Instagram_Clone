import 'package:firebase_auth/firebase_auth.dart';
import 'package:igclone_flutter/state/posts/typedefs/user_id.dart';

class Authenticator {
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;
}
