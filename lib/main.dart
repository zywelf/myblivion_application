// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:myblivion/screens/disclaimer_screen.dart';
import 'package:myblivion/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblivion/screens/lock_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode
        .immersiveSticky); //Permette all'app di essere in fullscreen
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              //Imposta come testo di base lo stile Google
              Theme.of(context).textTheme,
            ),
            primaryColor: Colors.white),
        home: HomeScreen(),
        routes: {
          //Sono le variabili che permette di spostarmi da una schermata ad un altra
          '/HomePage': (BuildContext context) => HomeScreen(),
          '/DisclaimerPage': (context) => const DisclaimerScreen(),
          '/LockPage': (context) => const LockScreen(),
        });
  }
}
