import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/artikel_provider.dart';
import 'package:shamo/providers/budidaya_provider.dart';
import 'package:shamo/providers/cuaca_provider.dart';
import 'package:shamo/providers/rekomendasi_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/artikel_tile.dart';
import 'package:shamo/widget/budidaya_tile.dart';
import 'package:shamo/widget/cuaca_card.dart';
import 'package:shamo/widget/rekomendasi_tile.dart';

import '../../widget/product_tile.dart';

class CuacaList extends StatelessWidget {
  const CuacaList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    CuacaProvider cuacaProvider = Provider.of<CuacaProvider>(context);
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
                            'Cuaca',
                            style: primaryTextStyle.copyWith(
                                fontSize: 25, fontWeight: bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                child: Container(
              margin: EdgeInsets.only(top: height / 4),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: width / 20,
                    ),
                    Row(
                      children: cuacaProvider.cuacas
                          .map((cuaca) => CuacaCard(cuaca))
                          .toList(),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuaca'),
        backgroundColor: backgroundColor3,
        elevation: 0,
      ),
      body: ListView(children: [header()]),
    );
  }
}
