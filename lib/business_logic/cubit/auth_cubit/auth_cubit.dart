import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthCubit extends Cubit<User?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(null);

  // Function to check the current user's authentication state
  void checkCurrentUser() {
    emit(_auth.currentUser);
  }

  // Function to sign in anonymously
  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      emit(userCredential.user);
    } catch (e) {
      emit(null);
      print("Error signing in anonymously: $e");
    }
  }

  // Function to sign out
  Future<void> signOut() async {
    await _auth.signOut();
    emit(null);
  }
}
