import 'package:comments_app/utils/authentication_service.dart';
import 'package:comments_app/utils/firestore_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuthService firebaseAuthService(FirebaseAuthServiceRef ref) {
  return FirebaseAuthService();
}

@Riverpod(keepAlive: true)
FirestoreService firestoreService(FirestoreServiceRef ref) {
  return FirestoreService();
}
