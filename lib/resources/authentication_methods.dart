import 'package:amazonclone/models/user_details_model.dart';
import 'package:amazonclone/resources/cloud_firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    password.trim();
    email.trim();
    String output = "Something went wrong";
    if (name != "" && password != "" && email != "" && address != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        output = "success";
        await cloudFirestoreClass.uploadNameAndAddressToDatabase(
            user:user);
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    password.trim();
    email.trim();
    String output = "Something went wrong";
    if (password != "" && email != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields";
    }
    return output;
  }
}
