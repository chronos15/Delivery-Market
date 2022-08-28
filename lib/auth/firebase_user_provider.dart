import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MobAPIFirebaseUser {
  MobAPIFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MobAPIFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MobAPIFirebaseUser> mobAPIFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<MobAPIFirebaseUser>((user) => currentUser = MobAPIFirebaseUser(user));
