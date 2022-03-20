import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe_app/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Screens/Home/naviigation_drawer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel LoggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.LoggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.sort,
        //     color: Colors.white,
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body:Center(),
    );
  }

  Future<void> Logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/loginPage');
  }
}


// Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Welcome to the landing Page",
//                 style: TextStyle(fontSize: 15.0),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "${LoggedInUser.email}",
//                 style: TextStyle(fontSize: 15.0),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 "${LoggedInUser.firstName}${LoggedInUser.secondName}",
//                 style: TextStyle(fontSize: 15.0),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                   label: Text('LogoOut'),
//                   onPressed: () {
//                     Logout(context);
//                   }),
//             ],
//           ),
//         ),
//       ),