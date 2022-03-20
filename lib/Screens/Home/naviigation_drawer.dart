import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/Model/user_model.dart';
import 'package:recipe_app/Screens/Home/drawer_item.dart';



class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
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
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'My Application',
                icon: Icons.description,
                onPressed: () => onItemPressed(context, index: 4),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Edit Resume',
                  icon: Icons.receipt_long,
                  onPressed: () => onItemPressed(context, index: 1)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Edit Preferences',
                  icon: Icons.room_preferences,
                  onPressed: () => onItemPressed(context, index: 2)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Safety Tips',
                  icon: Icons.safety_divider,
                  onPressed: () => onItemPressed(context, index: 3)),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Setting',
                  icon: Icons.settings,
                  onPressed: () => onItemPressed(context, index: 4)),
              const SizedBox(
                height: 30,
              ),
              ActionChip(
                  label: Text('LogoOut'),
                  onPressed: () {
                    Logout(context);
                  }),
              
              
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.pop(context);
        break;
    }
  }

  Widget headerWidget() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage:AssetImage('Assets/login.png'),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text("${LoggedInUser.firstName} ${LoggedInUser.secondName}",
                style: TextStyle(fontFamily: 'Montserrat',fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text("${LoggedInUser.email}",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12, color: Colors.white))
          ],
        )
      ],
    );
  }
  Future<void> Logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/loginPage');
  }
}
