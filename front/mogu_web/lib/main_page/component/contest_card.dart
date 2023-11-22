import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ContestCard extends StatelessWidget {
  //대회 이름
  final String name;
  //카테고리
  final String category;
  //종료 날짜
  final DateTime endDate;
  //url
  final String url;

  const ContestCard(
      {required this.name,
      required this.category,
      required this.endDate,
      required this.url,
      super.key});

  @override
  Widget build(BuildContext context) {
    final formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url));
                } else {
                  throw 'Could not launch $url';
                }
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 361,
                height: 166,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Colors.black, Colors.black.withOpacity(0)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(17.0, 15.0, 17.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '기간 : ~ $formattedEndDate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 2,
                            ),
                          ),
                        ],
                      ),
                      if (category == 'inha') // 조건 체크
                        Image.asset(
                          'assets/img/inha_logo.png',
                          height: 41,
                          width: 41,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
