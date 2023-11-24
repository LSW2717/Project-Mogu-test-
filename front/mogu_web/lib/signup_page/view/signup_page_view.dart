import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../common/const/colors.dart';
import '../../login_page/component/custom_text_form_field.dart';
import '../../login_page/view/login_page_view.dart';
import '../viewModel/signup_view_model.dart';

class SignUpPage extends ConsumerStatefulWidget {

  const SignUpPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  String name = '';
  String username = '';
  String password = '';
  String email = '';

  Future<void> _signup() async {
    final signupViewModel = ref.read(signupViewModelProvider.notifier);
    try {
      await signupViewModel.signup(name: name, username: username, password: password, email: email);
      // 메인 페이지로 이동

    } catch (e) {
      // 로그인 실패 시의 처리
    }
  }
  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupViewModelProvider);

    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        width: 332, // 너비 설정
        height: 377, // 높이 설정
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 32,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 192,
              child: Text(
                '회원가입',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4), // 내부 여백 설정
              child: CustomTextFormField(
                hintText: '  이름를 입력해주세요.',
                onChanged: (String value) {
                  name = value;
                },
                obscureText: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4), // 내부 여백 설정
              child: CustomTextFormField(
                hintText: '  아이디를 입력해주세요.',
                onChanged: (String value) {
                  username = value;
                },
                obscureText: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: CustomTextFormField(
                hintText: '  비밀번호를 입력해주세요.',
                onChanged: (String value) {
                  password = value;
                },
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4), // 내부 여백 설정
              child: CustomTextFormField(
                hintText: '  이메일를 입력해주세요.',
                onChanged: (String value) {
                  email = value;
                },
                obscureText: false,
              ),
            ),
            SizedBox(height: 40),
            SignUpButton(
              onSignUpPressed: () async {
                await _signup();
                context.pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => LoginPage(),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final VoidCallback onSignUpPressed;

  const SignUpButton({Key? key, required this.onSignUpPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextButton(
              onPressed: onSignUpPressed,// 현재 대화 상자를 닫음
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return DEVELOPER_COLOR; // 클릭했을 때의 색상
                    return INPUT_BG_COLOR; // 기본 색상
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // 버튼 모서리 둥글게
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15), // 버튼 안쪽 여백
                ),
              ),
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontSize: 13, // 글자 크기
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w400, // 글자 굵기
                  color: Colors.black, // 글자 색상
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
