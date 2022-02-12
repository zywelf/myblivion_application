// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:myblivion/widgets/palette.dart';
import 'package:myblivion/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final number = '118'; //Variabile per la chiamata di emergenza
  File? imageFile; //Variabile per la funzione della fotocamera

  //Variabili per il timer
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  //Variabile che indica per quanto far durare il countdown
  static const countdownDuration = Duration(minutes: 60);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Stack(children: [
          SfondoSchermate(),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text("LockScreen", style: titleMyApp),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false, //Rimuove il back button
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                    "https://assets6.lottiefiles.com/packages/lf20_3pdzxnty.json",
                    width: 320,
                    height: 400,
                    fit: BoxFit.fill,
                  ),
                  Center(child: buildTime()),
                ],
              ),
              //Tasto volatile che ti permette di accedere a chiamata di emergenza, Youtube, Bluetooth e Fotocamera
              floatingActionButton: SpeedDial(
                  animatedIcon: AnimatedIcons.home_menu,
                  backgroundColor: Colors.deepPurple,
                  overlayColor: Colors.transparent,
                  children: [
                    SpeedDialChild(
                        child: Icon(Icons.camera_alt),
                        label: 'Fotocamera',
                        onTap: () => getImage(source: ImageSource.camera)),
                    SpeedDialChild(
                      child: Icon(Icons.phone),
                      label: "Chiamata d'emergenza",
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber(number);
                      },
                    ),
                    SpeedDialChild(
                        child: Icon(Icons.bluetooth),
                        label: "Bluetooth",
                        onTap: () {
                          AppSettings.openBluetoothSettings();
                        }),
                    SpeedDialChild(
                        child: Icon(Icons.music_note),
                        label: 'Musica',
                        onTap: () async {
                          const url = 'https://youtube.com';

                          if (await canLaunch(url)) {
                            await launch(
                              url,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
                        })
                  ]))
        ]));
  }

  //Funzione che ti permette di effettuare una foto
  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  //Funzioni per il timer
  @override
  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
        exit(0);
      } else {
        duration = Duration(seconds: seconds);
      }
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: minutes, header: 'Minuti'),
        const SizedBox(width: 8),
        buildTimeCard(time: seconds, header: 'Secondi'),
      ],
    );
  }

  //Funzione che rappresenta visualmente il box con i minuti rimanenti
  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              time,
              style: timerText,
            ),
          ),
          const SizedBox(height: 24),
          Text(header, style: TextStyle(color: Colors.white)),
        ],
      );
}
