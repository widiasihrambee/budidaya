import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/widget/loading_button.dart';

import '../../theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    UserModel user = authProvider.user;
    handleLogout() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.logout()) {
        Navigator.pushNamed(context, '/sign-in');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Logout!',
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        // padding: EdgeInsets.only(
        //     top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Stack(
          children: [
            Container(
              height: height / 4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    offset: Offset(4, 4), // Shadow position
                  ),
                ],
                color: backgroundColor3,
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(20),
                //     bottomRight: Radius.circular(20))
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width / 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Rekomendasi',
                            //   style: primaryTextStyle.copyWith(
                            //       fontSize: 25, fontWeight: bold),
                            // ),
                            Image.asset(
                              'assets/image_profile.png',
                              width: width / 4,
                            ),
                            SizedBox(
                              height: height / 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: height / 3,
                              decoration: BoxDecoration(
                                color: backgroundColor5,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 20,
                                      offset: Offset(2, 4) // shadow position
                                      ),
                                ],
                              ),
                              child: Column(children: [
                                SizedBox(height: 3),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: ListTile(
                                    title: Text(
                                      '${user.name}',
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.person,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: ListTile(
                                    title: Text(
                                      'Privacy Policy',
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.info_sharp,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                               
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: ListTile(
                                    title: Text(
                                      'Terms Conditions',
                                    style: subtitleTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.document_scanner_outlined,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),                                
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 40.0),
                                  child: ListTile(
                                    title: Text(
                                      'Rating Apps',
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)
                                    ),
                                    trailing: Wrap(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
      ;
    }

    Widget logoutButton() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: handleLogout,
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(
              'Keluar',
              style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor3,
        elevation: 0,
      ),
      body: ListView(
          children: [header(), isLoading ? LoadingButton() : logoutButton()]),
    );
  }
}
