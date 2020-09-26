import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:utm_orgnization/dependencies.dart';
import 'package:utm_orgnization/models/user.dart';
import 'package:utm_orgnization/services/rest/rest_service.dart';

/*
  Author Credit :Ibrahim Katari
  Auth Services File.
*/
class AuthServices with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isAuthenticated = false;

  get isAuthenticated => _isAuthenticated;
  set setIsAuthnticated(bool newAuth) {
    _isAuthenticated = newAuth;
    notifyListeners();
  }

  Future signIn({
    String email,
    String password,
  }) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      print(e.message);
      String errorMessgae = e.message;
      return errorMessgae;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<String> retreiveToken() async {
    var crrUser = await _auth.currentUser();
    IdTokenResult idtoken = await crrUser.getIdToken();
    String token = idtoken.token;
    return token;
  }

  User userFromFirebaseUser(FirebaseUser user) {
    if (user != null) {
      _isAuthenticated = true;
      notifyListeners();
      return User(
        displayName: user.displayName,
        uid: user.uid,
        photoUrl: user.photoUrl,
        email: user.email,
      );
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<User> get user {
    service<AuthServices>()
        .retreiveToken()
        .then((value) => service<RestService>().idToken = value);
    return _auth.onAuthStateChanged.map(userFromFirebaseUser);
  }

  Future signUp({
    String displayName,
    String email,
    String password,
    bool gender,
  }) async {
    final HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'signUp')
          ..timeout = const Duration(seconds: 30);

    try {
      final HttpsCallableResult result = await callable.call(
        <String, dynamic>{
          'displayName': displayName,
          'email': email,
          'password': password,
          'gender': gender,
        },
      );
      return result;
    } on CloudFunctionsException catch (e) {
      print('caught firebase functions exception');
      print(e.code);
      print(e.message);
      print(e.details);

      return null;
    } catch (e) {
      print('caught generic exception');
      print(e);
      return null;
    }
  }

  Future updateProfile(
      {String uid,
      String displayName,
      String password,
      String email,
      BuildContext context}) async {
    final HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'updateUser')
          ..timeout = const Duration(seconds: 30);

    try {
      print('Update user $uid , $displayName, $password, $email');
      final HttpsCallableResult result = await callable.call(
        <String, dynamic>{
          'uid': uid,
          'displayName': displayName,
          'email': email,
          'password': password,
        },
      );
      print(result.data);
      if (result.data['isError'] == false) {
        Provider.of<User>(context, listen: false).displayName = displayName;
        Provider.of<User>(context, listen: false).email = email;
      }
      notifyListeners();
      return result;
    } on CloudFunctionsException catch (e) {
      print('caught firebase functions exception');
      print(e.code);
      print(e.message);
      print(e.details);

      return null;
    } catch (e) {
      print('caught generic exception');
      print(e);
      return null;
    }
  }
}
