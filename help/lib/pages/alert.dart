// ignore_for_file: library_private_types_in_public_api, must_be_immutable, unused_local_variable, library_prefixes

import 'package:flutter/material.dart';
import 'package:help/function/function.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AlertPage extends StatefulWidget {
  String latitude = "", logitude = "";
  AlertPage(this.latitude, this.logitude, {Key? key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  //instancia de la clase methods
  Methods methods = Methods();
  //socket
  late IO.Socket socket;
  //datos del usuario
  String nombre = "",
      paterno = '',
      materno = '',
      direccion = '',
      sexo = '',
      edad = '',
      fecha = '',
      telefono = '',
      correo = '';

  // ########## guardar datos de preferencia #########
  // mantenemos abierta nuestra sesion utilizando el metodo
  Future getDataUser() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    SharedPreferences preferences4 = await SharedPreferences.getInstance();
    SharedPreferences preferences5 = await SharedPreferences.getInstance();
    SharedPreferences preferences6 = await SharedPreferences.getInstance();
    SharedPreferences preferences7 = await SharedPreferences.getInstance();
    SharedPreferences preferences8 = await SharedPreferences.getInstance();
    SharedPreferences preferences9 = await SharedPreferences.getInstance();
    SharedPreferences preferences10 = await SharedPreferences.getInstance();
    setState(() {
      nombre = preferences1.getString('nombre').toString();
      paterno = preferences2.getString('paterno').toString();
      materno = preferences3.getString('materno').toString();
      direccion = preferences4.getString('direccion').toString();
      sexo = preferences5.getString('sexo').toString();
      edad = preferences6.getString('edad').toString();
      fecha = preferences7.getString('fecha').toString();
      telefono = preferences8.getString('telefono').toString();
      correo = preferences9.getString('correo').toString();
    });
  } //cierre de getEmail

  @override
  void initState() {
    super.initState();
    getDataUser();
  } //cierre de initstate

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor: Colors.black),
            child: Container(
              width: 230,
              height: 230,
              alignment: Alignment.center,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Card(
                shape: const CircleBorder(),
                child: Container(
                  width: 220,
                  height: 220,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Column(
                      children: const [
                        Icon(
                          Icons.warning,
                          size: 150,
                        ),
                        Text(
                          "! Alertar ¡",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onPressed: () {
              methods.flutterToats("Alerta Activada", Colors.red, 30);
              alerts(widget.latitude, widget.logitude, nombre, paterno, materno,
                  direccion, sexo, edad, fecha, telefono, correo);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  } // cierre de widget

  //************************ Mandamos la Alerta **************************** */
  alerts(latitude, logitude, nombre, paterno, materno, direccion, sexo, edad,
      fecha, telefono, correo) {
    socket = IO.io("https://panicbuttom.herokuapp.com/", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();

    socket.emit('alert', {
      latitude,
      logitude,
      nombre,
      paterno,
      materno,
      direccion,
      sexo,
      edad,
      fecha,
      telefono,
      correo
    });

    socket.onConnect((data) {
      // ignore: avoid_print
      print("----connected----");
    });
    // ignore: avoid_print
    print(socket.connected);
    //return "";
  }
}
