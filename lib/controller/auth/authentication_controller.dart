
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as dev;

class AuthController{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnonymous() async{
    try {
      dynamic auth = await _auth.signInAnonymously();
      UserCredential user = auth.user;
      return user;
    } catch(e) {
      dev.log("ERROR $e");
      return null;
    }
  }

}