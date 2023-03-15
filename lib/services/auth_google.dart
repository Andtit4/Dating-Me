import 'package:dating/screens/home1.dart';
import 'package:dating/services/external_db_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  signInWithGoogle() async {
    print('___Google_sign_init!');
    // Begin interactive sign in process
    final GoogleSignInAccount? getUser = await GoogleSignIn().signIn();
    // Obtaining auth details from request
    final GoogleSignInAuthentication gAuth = await getUser!.authentication;
    // Create new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    print('__Id_token___${gAuth.accessToken}');
    if (gAuth.idToken != null) {
      print('__Authorized__');
      // DatingApi().user_login(gAuth.idToken);
      // DatingApi().insert_user(gAuth.accessToken.toString());
      Get.to(() => HomeScreen(user_token: gAuth.accessToken));
    } else {
      DatingApi().insert_user(gAuth.idToken);
    }
    // let user sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
