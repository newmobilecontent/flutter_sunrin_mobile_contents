//  FireBase 인용
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user;        // firebase user
  Observable<Map<String, dynamic>> profire; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profire = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db.collection('users').document(u.email).snapshots().map((snap) => snap.data);
      } else {
        return Observable.just({ });
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.accessToken,
        accessToken: googleAuth.idToken
    );
    FirebaseUser user = await _auth.signInWithCredential(credential);
    
    print('signed in ' + user.displayName);
    return user;
  }

//  void updateUserData(FirebaseUser user) async {
//
//  }
//
//  void signOut() {
//
//  }
//
//  final AuthService authService = AuthService();
}