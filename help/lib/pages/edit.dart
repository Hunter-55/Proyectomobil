// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, unnecessary_import, non_constant_identifier_names, must_be_immutable, deprecated_member_use, unnecessary_null_comparison, prefer_if_null_operators, unused_local_variable, unnecessary_new

import 'dart:ui';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:help/function/function.dart';
import 'package:help/menu/menu.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class EditPage extends StatefulWidget {
  String nombre,
      paterno,
      materno,
      direccion,
      sexo,
      edad,
      fecha,
      telefono,
      correo,
      contrasena;
  EditPage(this.nombre, this.paterno, this.materno, this.direccion, this.sexo,
      this.edad, this.fecha, this.telefono, this.correo, this.contrasena,
      {Key? key})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //instancia de la clase methods
  Methods methods = Methods();
  //text controller
  TextEditingController name = TextEditingController();
  TextEditingController lastnameP = TextEditingController();
  TextEditingController lastnamM = TextEditingController();
  TextEditingController otherGender = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController cellphone = TextEditingController();
  TextEditingController emails = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordconfirm = TextEditingController();
  String groupValue = ''; //string valor del genero
  final format1 = DateFormat("dd/MM/yyyy"); //formato de fecha
  DateTime selectedDate = DateTime.now(); //obtener fecha actual
  bool ispassword = true, showpassword = true; //muestra el password o lo oculta
  late Icon iconeye =
      const Icon(Icons.remove_red_eye); //icono de visualizar password
  //info del usuario

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff292C31),
          ),
          Transform.translate(
            offset: Offset(size.width * .01, size.height * .01),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/user.png",
                      width: 130,
                    ),
                    Transform.translate(
                      offset: Offset(size.width * .1, -size.width * .1),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), primary: Colors.white),
                        child: Container(
                          width: 30,
                          height: 30,
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
                    /******************* nombre ********************/
                    components(Icons.person_outlined, widget.nombre, name,
                        false, false),
                    const SizedBox(height: 15),
                    /******************* apellido paterno ********************/
                    components(Icons.person_outlined, widget.paterno, lastnameP,
                        false, false),
                    const SizedBox(height: 15),
                    /******************* apellido materno ********************/
                    components(Icons.person_outlined, widget.materno, lastnamM,
                        false, false),
                    const SizedBox(height: 15),
                    /******************* sexo ********************/
                    component_gender(otherGender),
                    (groupValue == 'Otro')
                        ? Column(
                            children: [
                              const SizedBox(height: 15),
                              components(Icons.wc_outlined, widget.sexo,
                                  otherGender, false, false),
                              const SizedBox(height: 15)
                            ],
                          )
                        : const SizedBox(height: 15),
                    /******************* Fecha de nacimiento ********************/
                    component_birthdate(),
                    const SizedBox(height: 15),
                    /******************* telefono ********************/
                    components(Icons.phone_outlined, widget.telefono, cellphone,
                        false, true),
                    const SizedBox(height: 15),
                    /******************* correo ********************/
                    components(Icons.email_outlined, widget.correo, emails,
                        true, false),
                    const SizedBox(height: 15),
                    /******************* contraseña ********************/
                    component_password(
                        password, "*" * widget.contrasena.length),
                    const SizedBox(height: 15),
                    /******************* confirmar contraseña ********************/
                    component_password(
                        passwordconfirm, "*" * widget.contrasena.length),
                    /******************* botón de registro ********************/
                    const SizedBox(height: 15),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        List<String> birthday = methods.birthday(
                            selectedDate != null
                                ? selectedDate
                                : null); // retorna una edad tipo String
                        confirmEdition(
                            name.text != '' ? name.text : widget.nombre,
                            lastnameP.text != ''
                                ? lastnameP.text
                                : widget.paterno,
                            lastnamM.text != ''
                                ? lastnamM.text
                                : widget.materno,
                            address.text != ''
                                ? address.text
                                : widget.direccion,
                            groupValue != ''
                                ? groupValue != 'Otro'
                                    ? groupValue
                                    : otherGender.text != ''
                                        ? otherGender.text
                                        : widget.sexo
                                : widget.sexo,
                            birthday[0] != '' ? birthday[0] : widget.edad,
                            birthday[1] != '' ? birthday[1] : widget.fecha,
                            cellphone.text != ''
                                ? cellphone.text
                                : widget.telefono,
                            emails.text != '' ? emails.text : widget.correo,
                            password.text != ''
                                ? password.text
                                : widget.contrasena);
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
                          'Actualizar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  } // cierre de widget

  /*########## Componentes de texto ##########*/
  Widget components(IconData icon, String hintText,
      TextEditingController object, bool isEmail, bool isPhone) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.15,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        controller: object,
        obscureText: false,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : isPhone
                ? TextInputType.number
                : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  } // cierre de Widget component1

  /*########## Componente de seleccion de genero ##########*/
  Widget component_gender(TextEditingController object) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.15,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: <Widget>[
          //radio para definir hombre o mujer
          Radio(
            value: "Hombre",
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
          ),
          const Text(
            "Hombre",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 5),
          //radio mujer
          Radio(
            value: "Mujer",
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
          ),
          const Text(
            "Mujer",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 5),
          //radio Otro
          Radio(
            value: "Otro",
            groupValue: groupValue,
            onChanged: (value) {
              setState(() {
                groupValue = value.toString();
              });
            },
          ),
          const Text(
            "Otro Genero",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  } // cierre de Widget component_gender

  /*########## Componente de seleccion de fecha de nacimiento ##########*/
  Widget component_birthdate() {
    Size size = MediaQuery.of(context).size;
    return Container(
      //height: size.width / 5.5,
      width: size.width / 1.15,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Fecha de Nacimiento: (${format1.pattern})',
            style: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
          ),
          DateTimeField(
            format: format1,
            onShowPicker: (context, currentValue) async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime.now());
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
              return picked;
            },
          ),
        ],
      ),
    );
  } //cierre de Widget component_birthdate

  /*########## Componente de seleccion de fecha de nacimiento ##########*/
  Widget component_password(TextEditingController object, String labeltext) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.15,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        controller: object,
        obscureText: ispassword ? showpassword : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: labeltext,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
          suffixIcon: ispassword
              ? IconButton(
                  icon: iconeye,
                  onPressed: () {
                    setState(() {
                      showpassword = !showpassword;
                      if (showpassword) {
                        iconeye = const Icon(Icons.remove_red_eye);
                      } else {
                        iconeye = const Icon(Icons.visibility_off);
                      }
                    });
                  })
              : null,
        ),
      ),
    );
  }

  /// ****************metodo confirmar si los datos son vacios ************************ */
  confirmEdition(nombre, paterno, materno, direccion, sexo, edad, fecha,
      telefono, correo, contrasena) {
    if (nombre != '' ||
        paterno != '' ||
        materno != '' ||
        direccion != '' ||
        sexo != '' ||
        edad != '' ||
        fecha != '' ||
        telefono != '' && telefono.length == 10 ||
        correo != '' ||
        contrasena) {
      //muestra un alerta para confirmar cambios
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Actualizar Datos'),
            content: TextFormField(
              controller: passwordconfirm,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Ingresa Contraseña Actual",
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  if (passwordconfirm.text == widget.contrasena) {
                    methods.flutterToats(
                        "Cambios Actualizados", Colors.green, 20);
                    methods.preferencesDataUser(
                        nombre,
                        paterno,
                        materno,
                        direccion,
                        sexo,
                        edad,
                        fecha,
                        telefono,
                        correo,
                        contrasena);
                    Navigator.of(context).pushAndRemoveUntil(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => MenuPage(),
                        ),
                        (Route<dynamic> route) => false);
                  } else {
                    Navigator.of(context).pop();
                    methods.flutterToats("Contraseña Invalida", Colors.red, 20);
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }
}
