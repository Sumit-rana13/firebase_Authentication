import 'package:firebase_project/function/authentication.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String username = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Email\pass_Auth")),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20),
              color: Colors.teal.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLogin
                      ? TextFormField(
                          key: ValueKey("username"),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.teal.shade700, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                              ),
                              hintText: "enter username",
                              prefixIcon: Icon(Icons.man_2)),
                          validator: (value) {
                            if (value.toString().length < 2) {
                              return "username is too short";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              username = value!;
                            });
                          },
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    key: ValueKey("email"),
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10),
                        //   borderSide: BorderSide(color: Colors.red, width: 2),
                        // ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.teal.shade700, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        hintText: "Enter your Email",
                        prefixIcon: Icon(Icons.mail)),
                    validator: (value) {
                      if (!(value.toString().contains("@"))) {
                        return "Invalid email Id";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    key: ValueKey("password"),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.teal.shade700, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        hintText: "enter password",
                        prefixIcon: Icon(Icons.password)),
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return "password is too small";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (!(_formkey.currentState!.validate())) {
                              final snackbar = SnackBar(
                                  content: const Text(
                                      "Please! filled complete information"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            }
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              isLogin
                                  ? signIn(email, password)
                                  : signUp(email, password);
                            }
                            // if (_formkey.currentState!.validate()) {
                            //   Navigator.push(context, MaterialPageRoute(
                            //     builder: (context) {
                            //       return const PostScreen();
                            //     },
                            //   ));
                            // }
                          },
                          child: isLogin ? Text("LogIn") : Text("SignUp"))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: isLogin
                          ? Text("Don't have an account? Signed up")
                          : Text("Already Signed Up? LoginIn"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
