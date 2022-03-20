import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  
  
  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon:const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child:Container(
                    width: 400,
                    height: 300,
                    child: Image.asset(
                        'Assets/login.png',
                        
                        ),
                  ),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            style: TextStyle(
                                color: Colors.black, fontSize: 20.0),
                            autofocus: false,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please enter your Email");
                              }
                              //reg exp for email validation
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter valid email ");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.black)),
                            )),
                       const SizedBox(
                          height: 30.0,
                        ),
                        TextFormField(
                          style:
                              TextStyle(color: Colors.black, fontSize: 20.0),
                          autofocus: false,
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            //regex for Minimum six characters,
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return ("password is required for login");
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Minimum six characters");
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: 'Montserrat', color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                       const SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: RaisedButton(
                            onPressed: () {
                              SignIn(
                                  emailController.text, passwordController.text);
                            },
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            child: Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black),
                            )),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Dont have an Account?',
                      style: TextStyle(
                          fontFamily: 'Montserrat', color: Colors.black87),
                    ),
                    TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/SignUp'),
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        
      ),
    );
  }
  // loggin Funtion

  void SignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.pushReplacementNamed(context, '/landingPage'),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}