import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lets_meet/screens/home_screen.dart';
import 'package:lets_meet/screens/login_screen.dart';
import 'package:lets_meet/screens/video_call_screen.dart';
import 'package:lets_meet/utils/colors.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lets  Meet',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login':(context) => const LoginScreen(),
        '/home':(context) => const HomeScreen(),
        '/video-call':(context) => const VideoCallScreen(),
      },
      home: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if(snapshot.hasData){
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    ),
    );
  }
}

