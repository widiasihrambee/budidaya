import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/budidaya_page_detail.dart';
import 'package:shamo/pages/home/budidaya_page.dart';
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/pages/page/artikel_list.dart';
import 'package:shamo/pages/page/budidaya_list.dart';
import 'package:shamo/pages/page/cuaca_list.dart';
import 'package:shamo/pages/page/rekomendasi_list.dart';
import 'package:shamo/pages/product_page.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/sign_up_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/providers/artikel_provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/budidaya_provider.dart';
import 'package:shamo/providers/cuaca_provider.dart';
import 'package:shamo/providers/rekomendasi_provider.dart';
import 'package:shamo/theme.dart';

void main() async =>
    initializeDateFormatting('id_ID', 'null').then((_) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BudidayaProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RekomendasiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArtikelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CuacaProvider(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/budidaya': (context) => BudidayaPage(),
        '/product': (context) => ProductPage(),
        '/budidaya-show': (context) => BudidayaShow(),
        '/rekomendasi-show': (context) => RekomendasiShow(),
        '/artikel-show': (context) => ArtikelShow(),
        '/cuaca-list': (context) => CuacaList(),
      }),
    );
  }
}
