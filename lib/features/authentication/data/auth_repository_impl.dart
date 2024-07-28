import 'package:comments_app/features/authentication/domain/auth_repository.dart';
import 'package:comments_app/utils/authentication_service.dart';
import 'package:comments_app/utils/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _authService;
  final FirestoreService _storageService;

  AuthRepositoryImpl({
    required FirebaseAuthService authService,
    required FirestoreService storageService,
  })  : _authService = authService,
        _storageService = storageService;

  @override
  Future<bool> login(String email, password) async {
    User? user = await _authService.signInWithEmailAndPassword(email, password);
    return user != null;
  }

  @override
  Future<bool> signup(String name, String email, String password) async {
    User? user = await _authService.createUserWithEmailAndPassword(
      email,
      password,
    );

    if (user != null) {
      await user.updateDisplayName(name);
      try {
        await _storageService.addData(
          collectionPath: 'users',
          documentId: user.uid,
          data: {
            'name': name,
            'email': email,
          },
        );
      } catch (e) {
        await user.delete();
        rethrow;
      }
      return true;
    }
    return false;
  }
}
