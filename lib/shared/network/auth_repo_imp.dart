import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_projects/shared/network/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImp extends AuthRepo
{
  @override
  Future completeInformation({String name, String phone, String email, String password}) {

    throw UnimplementedError();
  }

  @override
  Future login(String email, String password) {

    throw UnimplementedError();
  }

  @override
  Future loginWithFacebook()async {

    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future loginWithGoogle()async {

    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future logout() {

    throw UnimplementedError();
  }

}