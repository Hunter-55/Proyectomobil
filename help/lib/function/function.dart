// ignore_for_file: invalid_use_of_visible_for_testing_member, avoid_print, depend_on_referenced_packages, unused_import
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//se guarda los metodos mas usados en la app

class Methods {
  /// ****************metodo para decorar palabras************************ */
  textDecoration(String text, final color0, final color1, double fonts) {
    return Stack(
      children: <Widget>[
        //fondo del texto.
        Text(
          text,
          style: TextStyle(
            fontSize: fonts,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 6
              ..color = color0,
          ),
        ),
        // texto solido.
        Text(
          text,
          style: TextStyle(
            fontSize: fonts,
            color: color1,
          ),
        ),
      ],
    );
  } //cierre de textDecoration

  /// ****************metodo flutterToas************************ */
  flutterToats(String msg, final color, double fonts) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: fonts);
  } //cierre de flutterToast

  // ########## calculamos la edad #########
  birthday(selectedDate) {
    if (selectedDate != null) {
      final format = DateFormat("yyyy-MM-dd");
      if (format.format(selectedDate).toString() !=
          format.format(DateTime.now()).toString()) {
        String fechausuario = format.format(selectedDate).toString();
        DateTime date1 = DateTime.parse(fechausuario);
        Duration date2 = DateTime.now().difference(date1);
        String differenceInYears = (date2.inDays / 365).floor().toString();
        print("======================== FECHA ==================");
        print(format.format(selectedDate).toString());
        print(differenceInYears);
        return [differenceInYears, format.format(selectedDate).toString()];
      }
      return ['', ''];
    }
    return ['', ''];
  } //cierre de _birthday

  /// ****************metodo para borrar datos del usuario************************ */
  Future removeData() async {
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    preferences1.remove('nombre');
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    preferences2.remove('paterno');
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    preferences3.remove('materno');
    SharedPreferences preferences4 = await SharedPreferences.getInstance();
    preferences4.remove('direccion');
    SharedPreferences preferences5 = await SharedPreferences.getInstance();
    preferences5.remove('sexo');
    SharedPreferences preferences6 = await SharedPreferences.getInstance();
    preferences6.remove('edad');
    SharedPreferences preferences7 = await SharedPreferences.getInstance();
    preferences7.remove('fecha');
    SharedPreferences preferences8 = await SharedPreferences.getInstance();
    preferences8.remove('telefono');
    SharedPreferences preferences9 = await SharedPreferences.getInstance();
    preferences9.remove('correo');
    SharedPreferences preferences10 = await SharedPreferences.getInstance();
    preferences10.remove('contrasena');
  } //cierre de removeData

  // ########## guardar datos de preferencia #########
  // mantenemos abierta nuestra sesion utilizando el metodo
  preferencesDataUser(name, lastnameP, lastnameM, address, sex, birthday, date,
      cellphone, emails, password) async {
    //SharedPreferences.setMockInitialValues({}); // ponerlo antes de los shared
    SharedPreferences preferences1 = await SharedPreferences.getInstance();
    preferences1.setString('nombre', name);
    SharedPreferences preferences2 = await SharedPreferences.getInstance();
    preferences2.setString('paterno', lastnameP);
    SharedPreferences preferences3 = await SharedPreferences.getInstance();
    preferences3.setString('materno', lastnameM);
    SharedPreferences preferences4 = await SharedPreferences.getInstance();
    preferences4.setString('direccion', address);
    SharedPreferences preferences5 = await SharedPreferences.getInstance();
    preferences5.setString('sexo', sex);
    SharedPreferences preferences6 = await SharedPreferences.getInstance();
    preferences6.setString('edad', birthday);
    SharedPreferences preferences7 = await SharedPreferences.getInstance();
    preferences7.setString('fecha', date);
    SharedPreferences preferences8 = await SharedPreferences.getInstance();
    preferences8.setString('telefono', cellphone);
    SharedPreferences preferences9 = await SharedPreferences.getInstance();
    preferences9.setString('correo', emails);
    SharedPreferences preferences10 = await SharedPreferences.getInstance();
    preferences10.setString('contrasena', password);
  } //cierre de preferencesDataUser

  // ########## guardar datos de preferencia #########
  // mantenemos abierta nuestra sesion utilizando el metodo
  getDataUser() async {
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

    List<String> userPreferences = [
      preferences1.getString('nombre').toString(),
      preferences2.getString('paterno').toString(),
      preferences3.getString('materno').toString(),
      preferences4.getString('direccion').toString(),
      preferences5.getString('sexo').toString(),
      preferences6.getString('edad').toString(),
      preferences7.getString('fecha').toString(),
      preferences8.getString('telefono').toString(),
      preferences9.getString('correo').toString(),
      preferences10.getString('contrasena').toString()
    ];

    return userPreferences;
  } //cierre de getEmail

}
