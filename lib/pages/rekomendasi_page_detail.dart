import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/models/rekomendasi_model.dart';
import 'package:shamo/theme.dart';

class RekomendsiPageDetail extends StatefulWidget {
  // const RekomendsiPageDetail({super.key});

  final RekomendasiModel rekomendasi;
  RekomendsiPageDetail(this.rekomendasi);

  @override
  State<RekomendsiPageDetail> createState() => _RekomendsiPageDetailState();
}

class _RekomendsiPageDetailState extends State<RekomendsiPageDetail> {
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
                        'https://budidaya.best/public/galeri/${widget.rekomendasi.url_image}',
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
                        '${widget.rekomendasi.title}',
                        style: subtitleTextStyle.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            // NOTE : PRICE

            // note: descipion
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 10, left: defaultMargin, right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: subtitleTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.rekomendasi.full_text}',
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
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
