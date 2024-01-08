import 'package:ecommerce_app/Api%20folder/api_helper.dart';
import 'package:ecommerce_app/Screens/loginView.dart';
import 'package:ecommerce_app/Widgets/Textfield.dart';
import 'package:ecommerce_app/models/UserModel/RegisterModel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import '../Api folder/my_Exception.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var fistNameController = TextEditingController();
  var emailController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController(text: "+91 ");
  var passwordController = TextEditingController();

  var focusNode = FocusNode();
  var focusNode2 = FocusNode();
  var focusNode3 = FocusNode();
  var focusNode4 = FocusNode();
  var focusNode5 = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fistNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  bool value = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          return FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.orange,
          body: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                Text(
                  "Register Page",
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Textfield(
                    labelText: "Name",
                    hintText: "Enter a name",
                    controller: fistNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: focusNode,
                    onFieldSubmitted: (_) {
                      return FocusScope.of(context).requestFocus(focusNode2);
                    },
                    onSaved: (p0) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a name";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                Textfield(
                    labelText: "LastName",
                    hintText: "Enter a Last_name",
                    controller: lastNameController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: focusNode2,
                    onFieldSubmitted: (p0) {
                      return FocusScope.of(context).requestFocus(focusNode3);
                    },
                    onSaved: (p0) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter a lastName";
                      }
                      return null;
                    }),
                SizedBox(height: 15),
                Textfield(
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: "Phone Number",
                    hintText: "Enter a Phone Number",
                    controller: phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    focusNode: focusNode3,
                    onFieldSubmitted: (p0) {
                      return FocusScope.of(context).requestFocus(focusNode4);
                    },
                    onSaved: (p0) {},
                    validator: (value) {
                      validateMobile(value!);
                    }),
                SizedBox(
                  height: 15,
                ),
                Textfield(
                    suffixIcon: Icon(Icons.close),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email",
                    hintText: "Enter an email",
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    focusNode: focusNode4,
                    onFieldSubmitted: (p0) {
                      return FocusScope.of(context).requestFocus(focusNode5);
                    },
                    onSaved: (p0) {},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "this field is required";
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15,
                ),
                Textfield(
                  obscureText: !value,
                  suffixIcon: IconButton(
                      onPressed: () {
                        value = !value;
                        setState(() {});
                      },
                      icon: value == false
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  prefixIcon: Icon(Icons.password),
                  labelText: "Password",
                  hintText: "Enter a password",
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  focusNode: focusNode5,
                  onSaved: (p0) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 6) {
                      return "Password length should atLeast 6 character";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4, backgroundColor: Colors.yellow),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (fistNameController.text != '' &&
                            emailController.text != "" &&
                            passwordController.text != '' &&
                            lastNameController.text != "" &&
                            phoneController.text != '') {
                          try {
                            setState(() {
                              ApiHelper().registerApi(
                                  body: RegisterModel(
                                          f_name: fistNameController.text
                                              .toString(),
                                          l_name: lastNameController.text
                                              .toString(),
                                          phone:
                                              phoneController.text.toString(),
                                          email:
                                              emailController.text.toString(),
                                          password: passwordController.text
                                              .toString())
                                      .toJson());
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return LoginView();
                                },
                              ));
                            });
                          } on UserAlreadyRegister catch (e) {

                            print("register uncssss");
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "User is Already regsiter : ${e.body}")));
                          }

                        } else {
                          print("not working");
                        }
                      }
                    },
                    child: Text(
                      "Sign Up",
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already a user",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                          child: SizedBox(
                        width: 5,
                      )),
                      TextSpan(
                          text: "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return LoginView();
                                },
                              ));
                            })
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
