// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_interpolation_to_compose_strings, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:help/pages/edit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //preferencias del usuarion nombre y correo iniciado para dejar sesion iniciada
  String nombre = "",
      paterno = '',
      materno = '',
      direccion = '',
      sexo = '',
      edad = '',
      fecha = '',
      telefono = '',
      correo = '',
      contrasena = '';

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
      contrasena = preferences10.getString('contrasena').toString();
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

    return Scaffold(
      backgroundColor: const Color(0xff292C31),
      body: Transform.translate(
        offset: const Offset(0, 10),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .01, vertical: size.height * .01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      width: 140,
                    ),
                    /* cerra sesion */
                    Transform.translate(
                      offset: const Offset(70, 90),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), primary: Colors.white),
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration:
                              const BoxDecoration(shape: BoxShape.rectangle),
                          child: const Icon(Icons.exit_to_app_outlined,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          /*
                          removeData();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => MyApp(),
                              ),
                              (Route<dynamic> route) => false);*/
                        },
                      ),
                    ),
                  ],
                ),
                infoTextBuild(
                    "Nombre: ", nombre + " " + paterno + " " + materno),
                infoTextBuild("Sexo: ", sexo),
                infoTextBuild("Fecha de Nacimiento: ", fecha),
                infoTextBuild("Edad: ", edad),
                infoTextBuild("Domicilio: ", direccion),
                infoTextBuild("Telefono: ", telefono),
                infoTextBuild("Correo: ", correo),
              ],
            ),
          ),
        ),
      ),
      //boton flotante
      floatingActionButton: SizedBox(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: FloatingActionButton(
            child: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(
                      nombre,
                      paterno,
                      materno,
                      direccion,
                      sexo,
                      edad,
                      fecha,
                      telefono,
                      correo,
                      contrasena),
                ),
              );
            },
          ),
        ),
      ),
    );
  } // cierre de widget

  /// ****************metodo para imprimir los datos de usuario************************ */
  Widget infoTextBuild(String parametro, String texto) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            parametro,
            style: const TextStyle(fontSize: 15.0, color: Colors.grey),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            texto == '' ? "" : texto,
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ),
        // linea para dividir
        Divider(
          color: Colors.grey,
          height: size.width * .1,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  } //cierre de infoTextBuild

}
