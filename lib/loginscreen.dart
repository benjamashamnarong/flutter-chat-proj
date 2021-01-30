import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final String title;

  LoginScreen({Key key, this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences _prefs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> handleSignIn() async {
    debugPrint('handleSignIn');

    _prefs = await SharedPreferences.getInstance();

    debugPrint('before _googleSignIn.signIn');
    
    GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((err) {
      debugPrint('----- $err -----');
    });

    debugPrint('after _googleSignIn.signIn');

    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      User firebaseUser =
          (await _firebaseAuth.signInWithCredential(credential)).user;
    } else {
      debugPrint('googleUser == null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
          child: Text(
            'Sign In With Google',
          ),
          color: Color(0xffdd4b39),
          highlightColor: Color(0xffff7f7f),
          splashColor: Colors.transparent,
          textColor: Colors.white,
          padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
          onPressed: handleSignIn,
        ),
      ),
    );
  }
}
