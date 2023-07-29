import 'package:flutter/material.dart';
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/models/rekomendasi_model.dart';
import 'package:shamo/pages/budidaya_page_detail.dart';
import 'package:shamo/pages/rekomendasi_page_detail.dart';
import 'package:shamo/theme.dart';

class RekomendasiTile extends StatelessWidget {
  // RekomendasiTile({super.key});

  final RekomendasiModel rekomendasi;
  RekomendasiTile(this.rekomendasi);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RekomendsiPageDetail(rekomendasi)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
              offset: Offset(4, 4), // Shadow position
            ),
          ],
        ),
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://budidaya.best/public/galeri/${rekomendasi.url_image}',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${rekomendasi.title}',
                  style: subtitleTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
