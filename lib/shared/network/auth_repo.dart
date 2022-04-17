abstract class AuthRepo {

  Future login(String email, String password);
  Future logout();
  Future loginWithGoogle();
  Future loginWithFacebook();
  Future completeInformation({String name, String phone, String email, String password});
}