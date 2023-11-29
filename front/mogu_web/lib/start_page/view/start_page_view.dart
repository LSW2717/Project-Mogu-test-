import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mogu_web/common/const/colors.dart';

import '../../common/layout/default_layout.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'start page',
      bottomNavigationBar: const Text3(),
      child: Column(
        children: <Widget>[
          const Expanded(
            flex: 355,
            child: ImageGradation(),
          ),
          const SizedBox(height: 12),
          Expanded(
            flex: 589,
            child: Column(
              children: [
                const Text1(),
                const SizedBox(height: 19),
                const Text2(),
                const SizedBox(height: 50),
                TextButton(
                  onPressed: () {
                    context.go('/main');
                  },
                  child: const Text(
                    '시작하기 >',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGradation extends StatelessWidget {
  const ImageGradation({super.key});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
          child: Image.asset(
            'asset/img/inhaUniversity.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.0), // 시작: 약간 투명한 흰색
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(1.0),
              ],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ],
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '인하대학교 소속 IVC 스타트업 팀 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
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
                  fontSize: 17,
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

class Text2 extends StatelessWidget {
  const Text2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: '프로젝트를 함께 진행할 ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '개발자',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  background: Paint()..color = DEVELOPER_COLOR,
                ),
              ),
              const TextSpan(
                text: ' / ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              TextSpan(
                text: '디자이너',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  background: Paint()..color = DEGIGNER_COLOR,
                ),
              ),
              const TextSpan(
                text: '를\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              const TextSpan(
                text: 'mogu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
              ),
              const TextSpan(
                text: '와 함께 모집하고 구해보세요!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
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

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 배경색 설정
      padding: const EdgeInsets.all(40), // 패딩 설정
      child: const Text(
        '참여 정보는 저희 프로젝트를 발전시키기 위한 자료로 \n쓰일 수 있음을 알려드립니다.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11, // 글자 크기 설정
          color: Colors.grey,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w500, // 글자 색상 설정
        ),
      ),
    );
  }
}
