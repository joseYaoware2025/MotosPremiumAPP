import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class MotosPremiumAuthUser {
  MotosPremiumAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MotosPremiumAuthUser> motosPremiumAuthUserSubject =
    BehaviorSubject.seeded(MotosPremiumAuthUser(loggedIn: false));
Stream<MotosPremiumAuthUser> motosPremiumAuthUserStream() =>
    motosPremiumAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
