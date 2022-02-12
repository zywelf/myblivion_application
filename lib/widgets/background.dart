// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

//Classe che verrà sempre richiamato da ogni altra classe per riprendere lo sfondo 
class SfondoSchermate extends StatelessWidget {
  const SfondoSchermate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/star_wars.gif'),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
