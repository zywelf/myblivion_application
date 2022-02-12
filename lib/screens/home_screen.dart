// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers, unused_element, prefer_final_fields
import 'package:myblivion/widgets/palette.dart';
import 'package:myblivion/widgets/widgets.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Variabili per l'animazione del testo bottone 'Cliccami'
  double _scaleFactor = 1.0;
  final Duration initialDelay = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SfondoSchermate(), //Richiamo del template creato per lo sfondo dell'app
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(     //Barra superiore dell'app con il suo nome
            title: Text('MyBlivion', style: titleMyApp),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DelayedDisplay(
              //Testo di presentazione dell'app
              delay: initialDelay,
              child: Text(
                "Salve a tutti e benvenuti su MyBlivion,",
                textAlign: TextAlign.center,
                style: welcomeText,
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 1),
              child: Text(
                "segui attentamente il disclaimer della schermata a seguire",
                textAlign: TextAlign.center,
                style:  welcomeText,
              ),
            ),
            DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 2),
              child: Text(
                "e goditi 1h di totale tranquillità con la musica",
                textAlign: TextAlign.center,
                style: welcomeText,
              ),
            ),
            Lottie.network(
              //Immagine animata dell'astronauta
              "https://assets7.lottiefiles.com/packages/lf20_vU6KP7/Astronaut/astronaout.json",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Center(
                //Testo di inizio con effetto rimbalzo
                child: BouncingWidget(
                    scaleFactor: _scaleFactor,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/DisclaimerPage'),
                    child: Text("Cliccami!",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          height: 4,
                        ))))
          ]))
    ]);
  }
}
