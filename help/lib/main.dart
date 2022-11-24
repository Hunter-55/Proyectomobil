import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:help/function/function.dart';
import 'package:help/menu/menu.dart';
import 'package:help/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  //inicializamos con la cuenta que no se ah cerrado
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  SharedPreferences preferences9 = await SharedPreferences.getInstance();
  //correo
  var correos = preferences9.getString('correo');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: correos == null ? const MyApp() : MenuPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool ispassword = true, showpassword = true;
  late Icon iconeye = const Icon(Icons.remove_red_eye);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // text controler
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    //instancia de la clase metodo
    Methods methods = Methods();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xff292C31),
          ),
          Transform.translate(
            offset: const Offset(0, 50),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.grey.withOpacity(0.4),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                              child: SizedBox(
                                width: size.width * .9,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: size.width * .15,
                                        bottom: size.width * .1,
                                      ),
                                      child: Text(
                                        'HELP',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(.8),
                                        ),
                                      ),
                                    ),
                                    /******************* correo ********************/
                                    Container(
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          right: size.width / 30),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.9),
                                        ),
                                        controller: email,
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email_outlined,
                                            color: Colors.white.withOpacity(.8),
                                          ),
                                          border: InputBorder.none,
                                          hintMaxLines: 1,
                                          hintText: "Correo",
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white.withOpacity(.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    /******************* contraseña ********************/
                                    Container(
                                      height: size.width / 8,
                                      width: size.width / 1.25,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          right: size.width / 30),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(.9),
                                        ),
                                        controller: password,
                                        obscureText:
                                            ispassword ? showpassword : false,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.lock_outline,
                                            color: Colors.white.withOpacity(.8),
                                          ),
                                          border: InputBorder.none,
                                          hintMaxLines: 1,
                                          hintText: "Contraseña",
                                          hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white.withOpacity(.5),
                                          ),
                                          suffixIcon: ispassword
                                              ? IconButton(
                                                  icon: iconeye,
                                                  onPressed: () {
                                                    setState(() {
                                                      showpassword =
                                                          !showpassword;
                                                      if (showpassword) {
                                                        iconeye = const Icon(
                                                            Icons
                                                                .remove_red_eye);
                                                      } else {
                                                        iconeye = const Icon(
                                                            Icons
                                                                .visibility_off);
                                                      }
                                                    });
                                                  })
                                              : null,
                                        ),
                                      ),
                                    ),
                                    /******************* botón texto ********************/
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: RichText(
                                            text: const TextSpan(
                                              text: 'Recuperar Contraseña',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage(),
                                              ),
                                            );

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RegisterPage(),
                                              ),
                                            );
                                          },
                                          child: RichText(
                                            text: const TextSpan(
                                              text: 'Crear Cuenta',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    /******************* botón inicio de sesión ********************/
                                    const SizedBox(height: 15),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        if (email.text != "" &&
                                            password.text != "") {
                                          if (email.text == "lopez@gmail.com" &&
                                              password.text == "123") {
                                            methods.flutterToats(
                                                "Acceso Exitoso",
                                                Colors.green,
                                                20);
                                            methods.preferencesDataUser(
                                                "Pedro",
                                                "Lopez",
                                                "Torres",
                                                "Calle alberca #674, baja california, mexico",
                                                "Hombre",
                                                "25",
                                                "12/01/1997",
                                                "8679097867",
                                                "lopez@gmail.com",
                                                "123");
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MenuPage(),
                                              ),
                                            );
                                          } else {
                                            methods.flutterToats(
                                                "Correo o Contraseña Incorrectos",
                                                Colors.red,
                                                20);
                                          }
                                        } else {
                                          methods.flutterToats("Campos Vacios",
                                              Colors.amber, 20);
                                        }
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
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          'Iniciar Sesión',
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  } // cierre de Widget build
}// cierre de la clase _MyHomePageState
