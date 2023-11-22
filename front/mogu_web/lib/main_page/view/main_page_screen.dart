import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mogu_web/common/layout/default_layout.dart';
import 'package:mogu_web/main_page/component/contest_card.dart';
import '../../login_page/view/login_page_screen.dart';
import '../viewModel/contest_model_view_model.dart';
import 'package:mogu_web/login_page/viewModel/login_view_model.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contestModelList = ref.watch(contestModelProvider);
    // final loginState = ref.watch(loginStateNotifierProvider);
    //
    // Future.delayed(Duration(seconds: 2), () {
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false,
    //       builder: (context) => AlertDialog(
    //         title: Text('로그인 필요'),
    //         content: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: <Widget>[
    //             TextFormField(
    //               decoration: InputDecoration(
    //                 labelText: '아이디',
    //                 hintText: '아이디를 입력하세요',
    //               ),
    //               // 추가적인 로직 (예: validator, onSaved 등)
    //             ),
    //             TextFormField(
    //               decoration: InputDecoration(
    //                 labelText: '비밀번호',
    //                 hintText: '비밀번호를 입력하세요',
    //               ),
    //               obscureText: true, // 비밀번호를 숨김 처리
    //               // 추가적인 로직 (예: validator, onSaved 등)
    //             ),
    //             SizedBox(height: 20),
    //             ElevatedButton(
    //               onPressed: () {
    //                 // 로그인 버튼 클릭 시 수행할 액션
    //               },
    //               child: Text('로그인'),
    //             ),
    //           ],
    //         ), // 여기에 로그인 폼 위젯을 넣으세요
    //       ),
    //   );
    //   // 화면을 어둡게 하고 로그인 창 표시
    // });

    // 로그인 상태가 아닐 경우 로그인 창 표시
    // if (!loginState.isLoggedIn) {
    //   Future.delayed(Duration(seconds: 2), () {
    //     // 화면을 어둡게 하고 로그인 창 표시
    //     if (!loginState.isLoggedIn) { // 로그인 상태를 다시 확인
    //       showDialog(
    //         context: context,
    //         barrierDismissible: false,
    //         builder: (context) => AlertDialog(
    //           title: Text('로그인 필요'),
    //           // content: LoginForm(), // 여기에 로그인 폼 위젯을 넣으세요
    //         ),
    //       );
    //     }
    //   });
    // }

    return DefaultLayout(
      title: 'main page',
      child: Center(
        child: contestModelList.when(
          data: (dataList) => ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final contest = dataList[index];
              return ContestCard(
                name: contest.name,
                category: contest.category,
                endDate: contest.endDate,
                url: contest.url,
              );
            },
          ),
          loading: () => CircularProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
      ),
    );
  }
}
