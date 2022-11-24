// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors_in_immutables, depend_on_referenced_packages, unnecessary_import, non_constant_identifier_names

import 'dart:ui';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            offset: const Offset(0, 40),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /******************* nombre ********************/
                    components(
                        Icons.person_outlined, 'Nombre', name, false, false),
                    const SizedBox(height: 15),
                    /******************* apellido paterno ********************/
                    components(Icons.person_outlined, 'Apellido Paterno',
                        lastnameP, false, false),
                    const SizedBox(height: 15),
                    /******************* apellido materno ********************/
                    components(Icons.person_outlined, 'Apellido Materno',
                        lastnamM, false, false),
                    const SizedBox(height: 15),
                    /******************* sexo ********************/
                    component_gender(otherGender),
                    (groupValue == 'Otro')
                        ? Column(
                            children: [
                              const SizedBox(height: 15),
                              components(Icons.wc_outlined, 'Específica',
                                  otherGender, false, false),
                              const SizedBox(height: 15)
                            ],
                          )
                        : const SizedBox(height: 15),
                    /******************* Fecha de nacimiento ********************/
                    component_birthdate(),
                    const SizedBox(height: 15),
                    /******************* telefono ********************/
                    components(Icons.phone_outlined, 'Telefono', cellphone,
                        false, true),
                    const SizedBox(height: 15),
                    /******************* correo ********************/
                    components(
                        Icons.email_outlined, 'Correo', emails, true, false),
                    const SizedBox(height: 15),
                    /******************* contraseña ********************/
                    component_password(password, 'Contraseña'),
                    const SizedBox(height: 15),
                    /******************* confirmar contraseña ********************/
                    component_password(passwordconfirm, 'Confirmar Contraseña'),
                    /******************* botón de registro ********************/
                    const SizedBox(height: 15),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage(),
                          ),
                        );
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
                          'Registrarsé',
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
}
