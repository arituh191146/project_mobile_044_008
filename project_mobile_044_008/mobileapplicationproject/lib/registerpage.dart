import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobileapplicationproject/info.dart/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 3, 23, 57), // กำหนดสีน้ำเงินให้กับ AppBar
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 45),
                        Text(
                          'CAR',
                          style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 248, 246, 246)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45),
                        Text(
                          'RENT',
                          style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 251, 248, 248)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45),
                        Text(
                          'ICT Mahidol Registration',
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 249, 245, 245)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Color.fromRGBO(0, 11, 50, 1.0),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 16),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'REGISTER',
                                    style: TextStyle(fontSize: 47, color: Colors.black),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Please enter your email"),
                                    EmailValidator(errorText: "Invalid email format"),
                                  ]),
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: const Color.fromARGB(255, 5, 34, 85),
                                    ),
                                  ),
                                  onSaved: (email) {
                                    profile.email = email;
                                  },
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  obscureText: _obscureText,
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Please enter your password"),
                                  ]),
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: const Color.fromARGB(255, 5, 34, 85),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  onSaved: (password) {
                                    profile.password = password;
                                  },
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () async {
                                    formkey.currentState!.save();

                                    if (formkey.currentState!.validate()) {
                                      try {
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                          email: profile.email!,
                                          password: profile.password!,
                                        )
                                            .then((value) {
                                          formkey.currentState!.reset();
                                          Fluttertoast.showToast(
                                            msg: "New user registered successfully!",
                                            gravity: ToastGravity.CENTER,
                                          );
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => Login()),
                                          );
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        String message;
                                        if (e.code == 'email-already-in-use') {
                                          message = "This email is already in use";
                                        } else if (e.code == 'weak-password') {
                                          message = "Password must be at least 6 characters long";
                                        } else {
                                          message = e.message ?? "An error occurred";
                                        }
                                        Fluttertoast.showToast(
                                          msg: message,
                                          gravity: ToastGravity.CENTER,
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 5, 34, 85),
                                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Already have an account?',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 5, 34, 85),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
