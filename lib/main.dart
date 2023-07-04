import 'package:amazonclone/layout/screen_layout.dart';
import 'package:amazonclone/provider/user_details_provider.dart';
import 'package:amazonclone/screens/product_screen.dart';
import 'package:amazonclone/screens/results_screen.dart';
import 'package:amazonclone/screens/sign_in_screen.dart';
import 'package:amazonclone/Utils/colortheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAhBGtm7UGbo4q47JZH3uyoqLo3aMcSy-A",
            authDomain: "clone-31bab.firebaseapp.com",
            projectId: "clone-31bab",
            storageBucket: "clone-31bab.appspot.com",
            messagingSenderId: "408312109133",
            appId: "1:408312109133:web:aaaef497da4c38c8f6e404"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>UserDetailsProvider())
      ],
      child: MaterialApp(
          title: "Amazon Clone",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                } else if (user.hasData) {
                  print("uid-${FirebaseAuth.instance.currentUser!.uid}");
                  return const ScreenLayout();
                } else {
                  return const SignInScreen();
                }
              })),
    );
  }
}
