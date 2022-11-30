abstract class IAuthenticationRepository {
  Future<void> signUp({required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({required String email, required String password});
  Future<void> logOut();
}