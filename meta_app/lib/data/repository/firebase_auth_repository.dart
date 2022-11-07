import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import '../../app/widgets/app_exception.dart';

class AuthRepository {
  FirebaseAuth auth;
  AuthRepository(this.auth);
// login method
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 60));
      return result.user;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        throw AppException(message: 'Invalid Email inputed');
      }
      if (err.code == "wrong-password") {
        throw AppException(message: 'Wrong Password, try again');
      }

      if (err.code == "user-not-found") {
        throw AppException(message: 'User not found');
      }

      if (err.code == "user-disabled") {
        throw AppException(message: 'User is Disabled');
      }
    } on TimeoutException catch (err) {
      print(err.message);
      throw AppException(message: 'Service timeout, check internet connection');
    } on SocketException catch (e) {
      throw AppException(message: 'No internet connection');
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  // register method
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 60));
      return result.user;
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-email') {
        throw AppException(message: 'Invalid Email inputed');
      }
      if (err.code == "weak-password") {
        throw AppException(message: 'Weak Password, re-enter your password');
      }

      if (err.code == "operation-not-allowed") {
        throw AppException(message: 'You dont have access');
      }

      if (err.code == "email-already-in-use") {
        throw AppException(message: 'Email already in use');
      }
    } on TimeoutException catch (err) {
      print(err.message);
      throw AppException(message: 'Service timeout, check internet connection');
    } on SocketException catch (e) {
      throw AppException(message: 'No internet connection');
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  // authchanges method
  Stream<User?> authChanges() => auth.idTokenChanges();

  // signout
  Future signOut() async {
    try {
      await auth.signOut().timeout(const Duration(seconds: 60));
    } on FirebaseAuthException catch (err) {
      throw AppException(message: err.toString());
    } on TimeoutException catch (err) {
      print(err.message);
      throw AppException(message: 'Service timeout, check internet connection');
    } on SocketException catch (e) {
      throw AppException(message: 'No internet connection');
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  // change password
  Future changePassword() async {
    User user = auth.currentUser!;
    if (user != null) {
      try {
        String email = user.email!;
        auth
            .sendPasswordResetEmail(email: email)
            .timeout(const Duration(seconds: 60));

        // await user.updatePassword(newPassword);
      } on FirebaseAuthException catch (err) {
        if (err.code == 'invalid-email') {
          throw AppException(message: 'Invalid Email inputed');
        }

        if (err.code == "auth/unauthorized-continue-uri") {
          throw AppException(message: 'You dont have access');
        }

        if (err.code == "auth/user-not-found") {
          throw AppException(message: 'Email already in use');
        } else {
          throw AppException(message: 'Error occurred, try again later');
        }
      } on TimeoutException catch (err) {
        print(err.message);
        throw AppException(
            message: 'Service timeout, check internet connection');
      } on SocketException catch (e) {
        throw AppException(message: 'No internet connection');
      } catch (e) {
        throw AppException(message: e.toString());
      }
    } else {
      throw AppException(message: 'User not Autheniticated');
    }
  }
}
