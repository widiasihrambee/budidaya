import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/artikel_provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/budidaya_provider.dart';
import 'package:shamo/providers/cuaca_provider.dart';
import 'package:shamo/providers/rekomendasi_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String is_login = "";

  @override
  void initState() {
    getLogin();
    getInit();
    super.initState();
  }

  getLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('name'));
    setState(() {
      is_login = pref.getString('name') ?? "";
    });
  }

  getInit() async {
    await Provider.of<BudidayaProvider>(context, listen: false).getBudidayas();
    // final login = false;
    // await Provider.of<BudidayaProvider>(context, listen: false).autoLogin();
    await Provider.of<RekomendasiProvider>(context, listen: false)
        .getRekomendasis();
    await Provider.of<ArtikelProvider>(context, listen: false).getArtikels();
    await Provider.of<CuacaProvider>(context, listen: false).getCuacas();
    if (is_login.isNotEmpty) {
      Provider.of<AuthProvider>(context, listen: false).autoLogin();
      Navigator.pushNamed(context, '/home');
    } else {
      Navigator.pushNamed(context, '/sign-in');
    }
    // TODO: implement initState
    // Timer(
    //   Duration(seconds: 3),
    //   () => ,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 288,
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash_screen.gif'))),
        ),
      ),
    );
  }
}
