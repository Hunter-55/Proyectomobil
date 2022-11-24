// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_constructors, deprecated_member_use, unnecessary_new

import 'package:flutter/material.dart';
import 'package:help/function/function.dart';
import 'package:help/main.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Methods methods = Methods();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        /******************* botón inicio de sesión ********************/
        const SizedBox(height: 15),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            methods.removeData();
            methods.flutterToats("Sesión Cerrada", Colors.green, 20);
            Navigator.of(context).pushAndRemoveUntil(
                new MaterialPageRoute(
                  builder: (BuildContext context) => MyApp(),
                ),
                (Route<dynamic> route) => false);
          },
          child: Container(
            margin: EdgeInsets.only(
              bottom: size.width * .05,
            ),
            height: size.width / 8,
            width: size.width / 1.25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  } // cierre de widget

}
