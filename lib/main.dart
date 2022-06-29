import 'package:auto_valley/Providers/Data_Provider.dart';
import 'package:auto_valley/Screens/Home_Screen/Home_Screen.dart';
import 'package:auto_valley/Screens/Sign_In_Screen.dart';
import 'package:auto_valley/Screens/Welcome_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen() ,
      ),
    );
  }
}
