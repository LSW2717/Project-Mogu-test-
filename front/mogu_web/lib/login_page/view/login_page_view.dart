import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mogu_web/signup_page/view/signup_page_view.dart';
import '../../common/const/colors.dart';
import '../component/custom_text_form_field.dart';
import '../viewModel/auth_view_model.dart';

class LoginPage extends ConsumerStatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  String username = '';
  String password = '';

  Future<void> _login() async {
    final authViewModel = ref.read(authViewModelProvider.notifier);
    try {
      await authViewModel.login(username: username, password: password);
      // 메인 페이지로 이동

    } catch (e) {
      // 로그인 실패 시의 처리


    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(authViewModelProvider);

    if (loginState.isLoggedIn) {
      context.pop();
    }

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
                '로그인',
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
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 4), // 내부 여백 설정
              child: CustomTextFormField(
                hintText: '  아이디를 입력해주세요.',
                onChanged: (String value) {
                  username = value;
                },
                obscureText: false,
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.done, // Enter 키를 누르면 로그인 시도
                onFieldSubmitted: (value) => _login(),
              ),
            ),
            SizedBox(height: 50),
            LoginButton(
              onLoginPressed: _login,
            ),
            SizedBox(height: 8),
            SignUpButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final VoidCallback? onLoginPressed;

  const LoginButton({super.key, this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextButton(
              onPressed: onLoginPressed,
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
                '로그인',
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: TextButton(
              onPressed: () {
                context.pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => SignUpPage(),
                );
              },
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
