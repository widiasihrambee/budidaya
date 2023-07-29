import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class BudidayaPageDetail extends StatefulWidget {
  // const BudidayaPageDetail({super.key});

  final BudidayaModel budidaya;
  BudidayaPageDetail(this.budidaya);

  @override
  State<BudidayaPageDetail> createState() => _BudidayaPageDetailState();
}

class _BudidayaPageDetailState extends State<BudidayaPageDetail> {
  List images = [
    'assets/image_shoes.webp',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget indicator(int idx) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: currentIndex == idx ? 16 : 4,
        height: 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == idx ? primaryColor : Color(0xffC4C4C4)),
      );
      
    } 
     Future<void>? _launched;
    final url = 'https://youtube.com/@kabarpertanianNK';
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
      int idx = -1;
      

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.chevron_left)),
              ],
            ),
          ),
          CarouselSlider(
              items: images
                  .map((image) => Image.network(
                        'https://budidaya.best/public/galeri/${widget.budidaya.url_image}',
                        width: MediaQuery.of(context).size.width,
                        height: 310,
                        fit: BoxFit.contain,
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }))),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              idx++;
              return indicator(idx);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // Note : header
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.budidaya.title}',
                        style: subtitleTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                      // Text(
                      //   'Hiking',
                      //   style: secondaryTextStyle.copyWith(fontSize: 12),
                      // )
                    ],
                  ),
                ),
                // Image.asset(
                //   'assets/button_wishlist_blue.png',
                //   width: 46,
                // )
              ]),
            ),
            // NOTE : PRICE
            // Container(
            //   padding: EdgeInsets.all(16),
            //   width: double.infinity,
            //   margin: EdgeInsets.only(
            //       top: 20, left: defaultMargin, right: defaultMargin),
            //   decoration: BoxDecoration(
            //       color: backgroundColor2,
            //       borderRadius: BorderRadius.circular(4)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Price start form',
            //         style: primaryTextStyle,
            //       ),
            //       Text(
            //         '\$143,98',
            //         style: priceTextStyle.copyWith(
            //             fontSize: 16, fontWeight: semiBold),
            //       )
            //     ],
            //   ),
            // ),
            // note: descipion
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: subtitleTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.budidaya.full_text,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
                  TextButton.icon(
              icon: Icon(Icons.skip_next_sharp),
              label: Text("Selanjutnya"),
              onPressed:() => setState(() {
          _launched = _launchUniversalLinkIos(uri);
        }),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffECEDEF),
      body: ListView(
        children: [header(), content()],
      ),
    );
  }
}
