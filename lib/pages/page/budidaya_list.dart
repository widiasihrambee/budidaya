import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/budidaya_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widget/budidaya_tile.dart';

import '../../widget/product_tile.dart';

class BudidayaShow extends StatelessWidget {
  const BudidayaShow({super.key});

  @override
  Widget build(BuildContext context) {
    BudidayaProvider budidayaProvider = Provider.of<BudidayaProvider>(context);
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
                            'Budidaya',
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
              margin: EdgeInsets.only(top: 120),
              child: Column(
                children: budidayaProvider.budidayas
                    .map((budidaya) => BudidayaTile(budidaya))
                    .toList(),
              ),
            ))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Budidaya'),
        backgroundColor: backgroundColor3,
        elevation: 0,
      ),
      body: ListView(children: [header()]),
    );
  }
}
