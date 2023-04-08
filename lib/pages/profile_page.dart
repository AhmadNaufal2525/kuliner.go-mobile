import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/optionLogin_page.dart';
import 'package:kuliner_go_mobile/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final username = user?.displayName ?? "User";
    final email = user?.email;
    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Profil",
                  style: whiteTextStyle.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
              color: whiteColor,
            ),
            child: Column(
              children: [
                CircleAvatar(),
                Text('$username'),
                Text('$email'),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const optionLoginPage()));
                  },
                  child: Text('Sign Out'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
