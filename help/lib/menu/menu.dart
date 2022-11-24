// ignore_for_file: unnecessary_string_interpolations, override_on_non_overriding_member, unused_import, library_prefixes, unnecessary_new, unused_field, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_interpolation_to_compose_strings

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help/function/function.dart';
import 'package:help/pages/alert.dart';
import 'package:help/pages/maps.dart';
import 'package:help/pages/profile.dart';
import 'package:help/pages/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:location/location.dart';

class MenuPage extends StatefulWidget {
  MenuPage({super.key});

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  var currentIndex = 0;
  Methods methods = Methods();

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.map_rounded,
    Icons.person_rounded,
    Icons.settings_rounded,
  ];

  List<String> listOfStrings = [
    'Inicio',
    'Mapa',
    'Perfil',
    'Ajustes',
  ];

  //variables de localización
  Location location = new Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  // ignore: prefer_final_fields
  bool _isListenLocation = false, _isGetLocation = false;
  //socket
  late IO.Socket socket;
  //info del user
  String nombre = "", paterno = '', materno = '';

  // mantenemos abierta nuestra sesion utilizando el metodo
  Future getDataUser() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    setState(() {
      nombre = preferences1.getString('nombre').toString();
      paterno = preferences2.getString('paterno').toString();
      materno = preferences3.getString('materno').toString();
    });
  } //cierre de getEmail

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket = IO.io("https://panicbuttom.herokuapp.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: location.onLocationChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          var data = snapshot.data as LocationData;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              primaryColor: Colors.deepPurple[300],
            ),
            home: menuNavigator(
                context,
                data.latitude.toString(),
                data.longitude.toString(),
                nombre + " " + paterno + " " + materno),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter menu',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              primaryColor: Colors.deepPurple[300],
            ),
            home: menuNavigator(
                context, "", "", nombre + " " + paterno + " " + materno),
          );
        }
      },
    );
  } //cierre del widget

  @override
  menuNavigator(
      BuildContext context, String latitude, String logitude, String nombre) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff292C31),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.3),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.white.withOpacity(.2)
                          : Colors.black.withOpacity(.8),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfStrings[index]}'
                                  : '',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.grey
                                : Colors.blueGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
          shadowColor: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          title: Center(
            child: methods.textDecoration(
                listOfStrings[currentIndex], Colors.black, Colors.white, 30),
          )),
      body: Center(
        child: _getItemPages(currentIndex, latitude, logitude, nombre),
      ),
    );
  }

  //cambiar de paguinas
  _getItemPages(int pos, String latitude, String logitude, String nombre) {
    latLngs(latitude, logitude, nombre);
    switch (pos) {
      case 0:
        return AlertPage(latitude, logitude);
      case 1:
        return MapsPage(latitude, logitude);
      case 2:
        return ProfilePage();
      case 3:
        return SettingPage();
    }
  } //cierre de _getItemPages

  //************************ Mandamos la coordenadas **************************** */
  void latLngs(String latitude, String logitude, nombreusuario) {
    /*socket = IO.io("http://192.168.0.5:3000/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });*/
    //socket.connect();

    socket.emit('latlng', {latitude, logitude, nombreusuario});

    socket.onConnect((data) {
      // ignore: avoid_print
      print("----connected----");
      /*socket.emit("test", "flutter conectado");
      socket.on("mobil", (text) {
        print(text);
        methods.flutterToats(text + latitude + "  " + logitude, Colors.red, 30);
      });*/
    });

    socket.on("disconnect",
        (data) => print("desconecytado: " + socket.id.toString()));

    // ignore: avoid_print
    print(socket.connected);
    //return "";
  } //cierre de latLngs

}
