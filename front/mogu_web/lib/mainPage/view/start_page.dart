import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'main_page',
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/img/inhaUniversity.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.7),
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.9),
                        Colors.white,
                      ],
                      stops: [
                        0.0,
                        0.1,
                        0.2,
                        0.3,
                        0.4,
                        0.5,
                        0.6,
                        0.7,
                        0.8,
                        0.9,
                        1.0
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                IvcMogu(),
                SizedBox(height: 30),
                Mogu(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,// 배경색 설정
        padding: EdgeInsets.all(50), // 패딩 설정
        child: Text(
          '참여 정보는 저희 프로젝트를 발전시키기 위한 자료로 \n쓰일 수 있음을 알려드립니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13, // 글자 크기 설정
            color: Colors.grey, // 글자 색상 설정
          ),
        ),
      ),
    );
  }
}

class IvcMogu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '인하대학교 소속 IVC 스타트업 팀 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              TextSpan(
                text: 'mogu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
              TextSpan(
                text: '입니다.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Mogu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '프로젝트를 함께 진행할 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '개발자',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  background: Paint()..color = Colors.blue,
                ),
              ),
              TextSpan(
                text: ' / ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '디자이너',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  background: Paint()..color = Colors.yellow,
                ),
              ),
              TextSpan(
                text: '를\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: 'mogu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '와 함께 모집하고 구해보세요!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class Text1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 345,
          child: Text(
            '참여 정보는 저희 프로젝트를 발전시키기 위한 자료로 \n쓰일 수 있음을 알려드립니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 11,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
