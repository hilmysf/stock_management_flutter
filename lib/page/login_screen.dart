import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_management_flutter/firebase_config/auth_services.dart';
import 'package:stock_management_flutter/main.dart';
import 'package:stock_management_flutter/page/dashboard_screen.dart';
import 'package:stock_management_flutter/page/register_screen.dart';

var fontFamily = 'Poppins';
Color a = Color(0xff25C266);
Color b = Color(0xff37dc9a);
Color c = Color(0xff33333F);
Color d = Color(0xff8E8E93);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _emailValidate = false;
  bool _passwordValidate = false;

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemWidth = size.width - 64;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            physics:
                ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Let’s Get\nStarted",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/signup_illustration.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: Theme.of(context).textTheme.body1,
                          errorText:
                              _emailValidate ? 'Email can\'t be empty' : null,
                          labelStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: b),
                          // ),
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: a),
                          // ),
                        ),
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Flexible(
                  //     child: Container(
                  //         width: itemWidth,
                  //         child: Text(
                  //           "Password",
                  //           style: TextStyle(fontSize: 20),
                  //           textAlign: TextAlign.start,
                  //         ))),
                  // SizedBox(
                  //   height: 4,
                  // ),
                  Container(
                    child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: Theme.of(context).textTheme.body1,
                          errorText: _passwordValidate
                              ? 'Password can\'t be empty'
                              : null,
                          labelStyle: TextStyle(color: Colors.grey),
                          border: UnderlineInputBorder(),
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: a),
                          // ),
                          // focusedBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: a),
                          // ),
                        ),
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          // backgroundColor:
                          //     MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.grey)))),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: fontFamily,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (emailController.text.isEmpty) {
                          setState(() {
                            _emailValidate = true;
                          });
                        } else if (passwordController.text.isEmpty) {
                          setState(() {
                            _passwordValidate = true;
                          });
                        } else {
                          print('login sukses');
                          User user = await AuthServices.signIn(
                              emailController.text, passwordController.text);
                          if (user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return MyHomePage();
                              }),
                            );
                          }
                          // else {
                          //   setState(() {});
                          // }
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(fontSize: 15),
                      ),
                      child: Text("Create An Account"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterScreen();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
