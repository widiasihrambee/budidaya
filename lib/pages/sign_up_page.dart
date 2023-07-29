import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/loading_button.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameControlller = TextEditingController(text: '');

  TextEditingController emailControlller = TextEditingController(text: '');

  TextEditingController passwordControlller = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
          name: nameControlller.text,
          email: emailControlller.text,
          password: passwordControlller.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Gagal Mendaftar!',
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/top.png'), fit: BoxFit.cover)),
        // margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
            ),
            Text(
              'Daftar',
              style:
                  blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Daftar Untuk Melanjutkan',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Nama Lengkap',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_user.png',
                  width: 17,
                  color: subtitleColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  style: subtitleTextStyle,
                  controller: nameControlller,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Nama Kamu', hintStyle: subtitleTextStyle),
                )),
              ],
            )),
          )
        ]),
      );
    }

    Widget emailInput() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Email',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_email.png',
                  color: subtitleColor,
                  width: 17,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  style: subtitleTextStyle,
                  controller: emailControlller,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Email Kamu', hintStyle: subtitleTextStyle),
                )),
              ],
            )),
          )
        ]),
      );
    }

    Widget passwordInput() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        margin: EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Password',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Row(
              children: [
                Image.asset(
                  'assets/icon_password.png',
                  color: subtitleColor,
                  width: 17,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: TextFormField(
                  obscureText: true,
                  style: subtitleTextStyle,
                  controller: passwordControlller,
                  decoration: InputDecoration.collapsed(
                      hintText: 'Pasword', hintStyle: subtitleTextStyle),
                )),
              ],
            )),
          )
        ]),
      );
    }

    Widget signUpButton() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: handleSignUp,
            style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: Text(
              'Daftar',
              style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            )),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Sudah punya akun ? ',
            style: subtitleTextStyle.copyWith(fontSize: 12),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Masuk',
              style: purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.symmetric(
          //   horizontal: defaultMargin,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              nameInput(),
              // userNameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
