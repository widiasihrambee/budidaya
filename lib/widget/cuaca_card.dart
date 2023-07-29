import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shamo/models/cuaca_model.dart';
import 'package:shamo/theme.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:intl/date_symbol_data_local.dart';

class CuacaCard extends StatelessWidget {
  // const CuacaCard({super.key});

  final CuacaModel cuaca;
  CuacaCard(this.cuaca);

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'id_ID';
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final date = DateTime.fromMillisecondsSinceEpoch(cuaca.dt * 1000);
    // var format = DateFormat.yMd('id');
    var dateString = DateFormat('EEEEE', 'id').format(date);
    final dateFinal = DateTimeFormat.format(date, format: 'D, M j Y');
    final celcius = (cuaca.temp.day - 273.15).toStringAsFixed(0);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width / 2,
        height: height / 4,
        margin: EdgeInsets.only(right: width / 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryColor,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/${cuaca.weather[0].icon}.png',
            width: width / 15,
            height: height / 20,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: height / 160,
          ),
          Text(
            '$celcius\°C',
            style: secondaryTextStyle.copyWith(fontSize: 46),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${dateString}',
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: semiBold),
                  // overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                // Text(
                //   '\$58,67',
                //   style: subtitleTextStyle.copyWith(
                //       fontSize: 14, fontWeight: medium),
                // )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
