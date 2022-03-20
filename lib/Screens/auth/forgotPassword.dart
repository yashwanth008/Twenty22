import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class forgetPassword extends StatefulWidget {
  const forgetPassword({ Key? key }) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                const Text(
                  "Recover Password",
                  style: TextStyle(fontFamily: 'Montserrat',fontSize: 35, color: Colors.black),
                ),
                const SizedBox(
                  height: 145,
                ),
                TextFormField(
                    style:const TextStyle(color: Colors.black, fontSize: 20.0),
                    autofocus: false,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter your Email");
                      }
                      //reg exp for email validation
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
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
                      prefixIcon:const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          fontFamily: 'Montserrat', color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                    )),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      _auth
                          .sendPasswordResetEmail(email: emailController.text)
                          .then((value) => {
                                Navigator.pushNamed(context, '/loginPage'),
                                Fluttertoast.showToast(msg: "Check Your Mail"),
                              });
                    },
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Send Request',
                      style:
                          TextStyle(fontFamily: 'Montserrat',fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}