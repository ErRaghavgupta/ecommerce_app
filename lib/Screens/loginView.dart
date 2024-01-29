import 'package:ecommerce_app/Api%20folder/api_helper.dart';
import 'package:ecommerce_app/LocalStorage/sharedPreference.dart';
import 'package:ecommerce_app/Routes/routes.dart';
import 'package:ecommerce_app/Screens/registerView.dart';
import 'package:ecommerce_app/Urls/urls.dart';
import 'package:ecommerce_app/Widgets/Textfield.dart';
import 'package:ecommerce_app/models/UserModel/loginModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var focusNode = FocusNode();
  var focusNode2 = FocusNode();
  var value = false;
  String _errorMessage = '';

  bool validateEmail(String email) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return regex.hasMatch(email);
  }

  List<Map<String, dynamic>> faIcons = [
    {"icon": FontAwesomeIcons.facebookF, "color": Colors.blue},
    {"icon": FontAwesomeIcons.google, "color": Colors.red},
    {"icon": FontAwesomeIcons.apple, "color": Colors.yellow},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        return FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: [
            Text(
              "Welcome to Login View",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Textfield(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: "Email",
              hintText: "Enter an email",
              controller: emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              focusNode: focusNode,
              onFieldSubmitted: (_) {
                return FocusScope.of(context).requestFocus(focusNode2);
              },
              onSaved: (_) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "pls enter email";
                } else if (validateEmail(value)) {
                  return "pls enter a valid email";
                }
                return null;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Textfield(
              prefixIcon: Icon(Icons.password),
              suffixIcon: IconButton(
                  onPressed: () {
                    value = !value;
                    setState(() {});
                  },
                  icon: value == false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility)),
              obscureText: !value,
              labelText: "Password",
              hintText: "Enter a password",
              controller: passwordController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              focusNode: focusNode2,
              onSaved: (p0) {},
              validator: (value) {
                _errorMessage = '';

                // Password length greater than 6
                if (value!.length < 6) {
                  _errorMessage +=
                      'Password must be longer than 6 characters.\n';
                }

                // Contains at least one uppercase letter
                if (!value.contains(RegExp(r'[A-Z]'))) {
                  _errorMessage += '• Uppercase letter is missing.\n';
                }

                // Contains at least one lowercase letter
                if (!value.contains(RegExp(r'[a-z]'))) {
                  _errorMessage += '• Lowercase letter is missing.\n';
                }

                // Contains at least one digit
                if (!value.contains(RegExp(r'[0-9]'))) {
                  _errorMessage += '• Digit is missing.\n';
                }

                // Contains at least one special character
                if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                  _errorMessage += '• Special character is missing.\n';
                }

                // If there are no error messages, the password is valid
                return _errorMessage;
              },
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, elevation: 5),
                onPressed: () async {
                  var prefs = await Shared().getPrefs();
                  // var data = prefs.setString(Shared.tokenId, );
                  setState(() {
                    try {
                      ApiHelper()
                          .loginApi(LoginModel(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .toJson())
                          .then((value) {
                        print("value : ${value["token"]}");
                        prefs.setString(Shared.tokenId, value['token']);
                        // data = value["token"];
                        Navigator.pushNamed(context, CART_ROUTE);
                      }).catchError((error, stackTrace) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "ok",
                                    textScaleFactor: 1.4,
                                  ),
                                )
                              ],
                              title: SizedBox(
                                height: 150,
                                width: 150,
                                child: Center(
                                  child: Text(
                                    "Email is Already exist",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      });
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("login unsuccessful $e")));
                    }
                  });
                },
                child: Text(
                  "Sign in ",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Or\n Sign in with",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...faIcons.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        e['icon'],
                        color: e['color'],
                      ),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
                textAlign: TextAlign.center,
                textScaleFactor: 1.5,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an Account?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " Sign Up",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RegisterView();
                            },
                          ));
                        })
                ])),
          ],
        ),
      ),
    ));
  }
}
