
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn=GoogleSignIn();
var googleid;


Future<bool> googleSignin() async {

  final prefs= await SharedPreferences.getInstance();

  GoogleSignInAccount googleSignInAccount  = await googleSignIn.signIn();
  if(googleSignInAccount!=null ){
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(accessToken:googleSignInAuthentication.accessToken,idToken: googleSignInAuthentication.idToken);

    AuthResult result = await auth.signInWithCredential(credential);
    FirebaseUser _googleuser = await auth.currentUser();
    print(_googleuser.uid);
    googleid=_googleuser.uid;
    prefs.setString('googleId',googleid);
    return Future.value(true);
  }
}