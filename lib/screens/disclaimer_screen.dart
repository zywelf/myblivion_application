// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:app_settings/app_settings.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:lottie/lottie.dart';
import 'package:myblivion/widgets/palette.dart';
import 'package:myblivion/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DisclaimerScreen extends StatefulWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  _DisclaimerScreenState createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreen> {
  //Variabili per scorrere tra i testi del disclaimer
  int _currentStep = 0;
  double _scaleFactor = 1.0;
  @override
  Widget build(BuildContext context) => WillPopScope(
      //WillPopScope serve per impedire di tornare alla pagina precedente
      onWillPop: () async {
        return true;
      },
      child: Stack(children: [
        SfondoSchermate(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Disclaimer', style: titleMyApp),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.network(
              //Immagine animata del disclaimer
              "https://assets1.lottiefiles.com/packages/lf20_Tkwjw8.json",
              width: 100,
              height: 100,
              fit: BoxFit.fill,
            ),
            //Le avvertenze prima di avviare la modalità LockScreen
            Stepper(
                steps: const [
                  Step(
                      title: Icon(Icons.lock_clock_rounded,
                          color: Colors.white, semanticLabel: 'Lock'),
                      content: Text(
                          'Tutte le app verranno saranno temporaneamente bloccate',
                          style: textApp)),
                  Step(
                      title: Icon(Icons.phone_in_talk_rounded,
                          color: Colors.white, semanticLabel: 'Calls'),
                      content: Text(
                        'Ma potrai ricevere le chiamate o effettuare quelle di emergenza',
                        style: textApp,
                      )),
                  Step(
                      title: Icon(Icons.music_note_rounded,
                          color: Colors.white, semanticLabel: 'Music'),
                      content: Text(
                          "E puoi ascoltare la musica che vuoi da Youtube ed anche da cuffie e casse bluetooth",
                          style: textApp)),
                  Step(
                      title: Icon(Icons.settings,
                          color: Colors.white, semanticLabel: 'Setting'),
                      content: Text(
                          "Prima di procedere ti consiglio di impostare la sospensione dello schermo per 30 minuti ed ottimizzare la batteria dal bottone a lato",
                          style: textApp))
                ],
                //Funzioni che permetto di leggere tutte i disclaimer
                onStepTapped: (int newIdex) {
                  setState(() {
                    _currentStep = newIdex;
                  });
                },
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep != 3) {
                    setState(() {
                      _currentStep += 1;
                    });
                  }
                },
                onStepCancel: () {
                  if (_currentStep != 0) {
                    setState(() {
                      _currentStep -= 1;
                    });
                  }
                }),
            //Testo con effetto rimbalzo che ti porta nella pagina lockscreen
            BouncingWidget(
                scaleFactor: _scaleFactor,
                onPressed: () => Navigator.pushNamed(context, '/LockPage'),
                child: Text("Iniziamo !",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      height: 4,
                    )))
          ]),
          //Tasto volatile per cambiare le impostazioni
          floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.view_list,
              backgroundColor: Colors.deepPurple,
              overlayColor: Colors.transparent,
              children: [
                SpeedDialChild(
                    child: Icon(Icons.stay_current_portrait_rounded),
                    label: "Schermo",
                    onTap: () {
                      AppSettings.openDisplaySettings();
                    }),
                SpeedDialChild(
                    child: Icon(Icons.battery_saver_rounded),
                    label: "Batteria",
                    onTap: () {
                      AppSettings.openBatteryOptimizationSettings();
                    }),
              ]),
        )
      ]));
}
