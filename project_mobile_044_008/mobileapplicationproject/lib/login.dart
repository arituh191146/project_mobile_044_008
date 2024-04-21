import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobileapplicationproject/info.dart/profile.dart';
import 'package:mobileapplicationproject/registerpage.dart';
import 'package:mobileapplicationproject/selectbrandcar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Login> {
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
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(

            appBar: AppBar(
            backgroundColor: Colors.black12,
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
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45),
                        Text(
                          'RENT',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 45),
                        Text(
                          'ICT Mahidol Registration',
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 47,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(
                                      errorText: "Please enter your email",
                                    ),
                                    EmailValidator(
                                      errorText: "Invalid email format",
                                    ),
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
                                    RequiredValidator(
                                      errorText: "Please enter your password",
                                    ),
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
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
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
                                    if (formkey.currentState!.validate()) {
                                      formkey.currentState!.save();
                                      print(
                                          "email = ${profile.email} password = ${profile.password}");
                                      try {
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                              email: profile.email!,
                                              password: profile.password!,
                                            )
                                            .then((value) {
                                          formkey.currentState!.reset();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return MyApp13();
                                              },
                                            ),
                                          );
                                        });
                                      } on FirebaseAuthException catch (e) {
                                        print(e.code);
                                        print(e.message);
                                        String message;
                                        if (e.code == 'invalid-credential') {
                                          message = "email or password not correct!!";
                                        } else {
                                          message = e.message!;
                                        }
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(message),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(255, 5, 34, 85),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 100,
                                      vertical: 12,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.login), // ไอคอน "login"
                                      SizedBox(width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                                      Text(
                                        'LOGIN',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
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
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
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
                                SizedBox(height: 16),
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 8),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                    // Handle sign-up logic here
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0,
                                      vertical: 0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign up now',
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
