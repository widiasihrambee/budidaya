import 'package:flutter/material.dart';
import 'package:shamo/pages/home/budidaya_page.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;
    final url = 'https://chat.whatsapp.com/Eg0RDU3ksd34yeTgLJ381g';
    final uri = Uri.parse(url);

    Future<void> _launchUniversalLinkIos(Uri url) async {
      final bool nativeAppLaunchSucceeded = await launchUrl(
        url,
        mode: LaunchMode.externalNonBrowserApplication,
      );
      if (!nativeAppLaunchSucceeded) {
        await launchUrl(
          url,
          mode: LaunchMode.inAppWebView,
        );
      }
    }

    Widget groupButton() {
      return FloatingActionButton(
        onPressed: () => setState(() {
          _launched = _launchUniversalLinkIos(uri);
        }),
        backgroundColor: primaryColor,
        child: Image.asset(
          'assets/group.png',
          width: 30,
          color: backgroundColor1,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: backgroundColor3,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_home.png',
                        width: 21,
                        color: currentIndex == 0
                            ? primaryColor
                            : Color(0xffFFFFFFFF),
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'assets/icon_user.png',
                        width: 21,
                        color: currentIndex == 1
                            ? primaryColor
                            : Color(0xffFFFFFFFF),
                      ),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return BudidayaPage();
          break;
        case 1:
          return ProfilePage();
          break;
        // case 2:
        //   return WishList();
        //   break;
        // case 3:
        //   return ChatPage();
        //   break;
        // default:
        //   return HomePage();
      }
      return HomePage();
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: backgroundColor5,
        floatingActionButton: groupButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customButtonNav(),
        body: body(),
      ),
    );
  }
}
