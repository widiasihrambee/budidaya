import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/cuaca_card.dart';
import 'package:shamo/widget/product_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class BudidayaPage extends StatefulWidget {
  const BudidayaPage({super.key});

  @override
  State<BudidayaPage> createState() => _BudidayaPageState();
}

class _BudidayaPageState extends State<BudidayaPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;
    Future<void>? _launched;
    final url = 'https://www.google.com/search?q=cuaca&sxsrf=AB5stBj9rQGdoK8LEp6jFH-ANMfhinK__A%3A1689231147942&ei=K5-vZL2OOffgseMPsvSOsAw&oq=cuaca&gs_lcp=ChNtb2JpbGUtZ3dzLXdpei1zZXJwEAEYADISCAAQigUQsQMQgwEQQxBGEIACMg0IABCKBRCxAxCDARBDMg4IABCABBCxAxCDARDJAzIICAAQgAQQkgMyBQgAEIAEMgcIABCKBRBDMgUIABCABDIFCAAQgAQ6CggAEEcQ1gQQsAM6BwgjEOoCECc6DQguEMcBEK8BEOoCECc6BAgjECc6CwgAEIAEELEDEIMBSgQIQRgAUP4QWKsXYI8iaANwAXgAgAH4A4gBzgqSAQkwLjIuMi41LTGYAQCgAQGwAQ_AAQHIAQg&sclient=mobile-gws-wiz-serp';
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
    Widget header() {
      return Container(
        // padding: EdgeInsets.only(
        //     top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Stack(
          children: [
            Container(
              height: 238,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 15,
                      offset: Offset(4, 4), // Shadow position
                    ),
                  ],
                  color: backgroundColor3,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, ${user.name}',
                            style: primaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                                color: blackColor),
                          ),
                          Text(
                            '@budidaya',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/image_profile.png'))),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(top: 180, left: 0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/budidaya-show');
                          },
                          child: Container(
                            width: width / 2.5,
                            height: height / 3.8,
                            margin: EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffECEDEF),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Image.asset(
                                    'assets/budidaya.png',
                                    width: width / 4,
                                    height: height / 6.7,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Budidaya',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: semiBold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/rekomendasi-show');
                          },
                          child: Container(
                            width: width / 2.5,
                            height: height / 3.8,
                            margin: EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffECEDEF),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 21,
                                  ),
                                  Image.asset(
                                    'assets/rekomendasi.png',
                                    width: width / 4,
                                    height: height / 6.7,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Rekomendasi',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: semiBold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                           onTap: () => setState(() {
          _launched = _launchUniversalLinkIos(uri);
        }),
                        
                          // () {
                          //   Navigator.pushNamed(context, '/cuaca-list');
                          // },
                          child: Container(
                            width: width / 2.5,
                            height: height / 3.8,
                            margin: EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffECEDEF),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Image.asset(
                                    'assets/cuaca.png',
                                    width: width / 4,
                                    height: height / 6.7,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cuaca',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: semiBold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/artikel-show');
                          },
                          child: Container(
                            width: width / 2.5,
                            height: height / 3.8,
                            margin: EdgeInsets.only(right: 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffECEDEF),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 21,
                                  ),
                                  Image.asset(
                                    'assets/artikel.png',
                                    width: width / 4,
                                    height: height / 6.7,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Artikel',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: semiBold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      );
    }

    // Widget categories() {
    //   return Container(
    //     margin: EdgeInsets.only(top: defaultMargin),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 color: primaryColor),
    //             child: Text(
    //               'All Shoes',
    //               style: primaryTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               'Running',
    //               style: subtitleTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               'Training',
    //               style: subtitleTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               'Basket',
    //               style: subtitleTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //             margin: EdgeInsets.only(right: 16),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(12),
    //                 border: Border.all(color: subtitleColor),
    //                 color: transparentColor),
    //             child: Text(
    //               'Hiking',
    //               style: subtitleTextStyle.copyWith(
    //                   fontSize: 13, fontWeight: medium),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Widget popularProductsTitle() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultMargin, left: defaultMargin, right: defaultMargin),
    //     child: Text(
    //       'Popular Products',
    //       style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
    //     ),
    //   );
    // }

    // Widget popularProducts() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 14),
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Row(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
    //           Row(
    //             children: [
    //               ProductCard(),
    //               ProductCard(),
    //               ProductCard(),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

    // Widget newArrivalsTitle() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultMargin, left: defaultMargin, right: defaultMargin),
    //     child: Text(
    //       'New Arrivals',
    //       style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
    //     ),
    //   );
    // }

    // Widget newArrivals() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 14),
    //     child: Column(
    //       children: [
    //         ProductTile(),
    //         ProductTile(),
    //         ProductTile(),
    //         ProductTile(),
    //         ProductTile(),
    //       ],
    //     ),
    //   );
    // }

    return ListView(
      children: [
        header(),
        // categories(),
        // popularProductsTitle(),
        // popularProducts(),
        // newArrivalsTitle(),
        // newArrivals()
      ],
    );
  }
}
