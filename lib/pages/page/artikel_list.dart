import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/artikel_model.dart';
import 'package:shamo/providers/artikel_provider.dart';
import 'package:shamo/providers/budidaya_provider.dart';
import 'package:shamo/providers/rekomendasi_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/artikel_tile.dart';
import 'package:shamo/widget/budidaya_tile.dart';
import 'package:shamo/widget/rekomendasi_tile.dart';

import '../../widget/product_tile.dart';

class ArtikelShow extends StatefulWidget {
  const ArtikelShow({super.key});

  @override
  State<ArtikelShow> createState() => _ArtikelShowState();
}

class _ArtikelShowState extends State<ArtikelShow> {
  var title = 'Artikel';
  late List<ArtikelModel> artikelList = List.from(getData());

  @override
  void initState() {
    super.initState();
  }

  getData() {
    ArtikelProvider artikelProvider = Provider.of<ArtikelProvider>(context);
    return artikelProvider.artikels;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ArtikelProvider artikelLisLama = Provider.of<ArtikelProvider>(context);
    searchList(String value) async {
      // print(jsonEncode(artikelLisLama));

      artikelList = artikelLisLama.artikels
          .where((artikel) =>
              artikel.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
      if (value.isEmpty) {
        setState(() {
          artikelList = List.from(artikelLisLama.artikels);
        });
      }
      setState(() {});
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
                padding: EdgeInsets.only(
                    top: height / 9, left: defaultMargin, right: defaultMargin),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: primaryTextStyle.copyWith(
                                fontSize: 25, fontWeight: bold),
                          ),
                          TextField(
                            onChanged: (value) => searchList(value),
                            style: TextStyle(color: subtitleColor),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: backgroundColor5,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none),
                                hintText: 'artikel',
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: subtitleColor,
                                ),
                                prefixIconColor: primaryTextColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Positioned(
            //     child: Container(
            //   margin: EdgeInsets.only(top: 150),
            //   child: Column(
            //     children: artikelProvider.artikels
            //         .map((artikel) => ArtikelTile(artikel))
            //         .toList(),
            //   ),
            // ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel'),
        backgroundColor: backgroundColor3,
        elevation: 0,
      ),
      body: Column(children: [
        header(),
        Expanded(
            child: ListView.builder(
                itemCount: artikelList.length,
                itemBuilder: (context, i) {
                  var artikel = artikelList[i];
                  return ArtikelTile(artikel);
                }))
      ]),
    );
  }
}
