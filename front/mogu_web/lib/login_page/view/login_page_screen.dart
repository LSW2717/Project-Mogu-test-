// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../viewModel/login_view_model.dart';
//
// class LoginPage extends ConsumerStatefulWidget {
//   static String get routeName => 'login';
//
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<LoginPage> createState() => _LoginPageState();
// }
//
//
// class _LoginPageState extends ConsumerState<LoginPage> {
//   String username = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch()
//
//     return Form(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           TextFormField(
//             decoration: InputDecoration(labelText: '사용자 이름'),
//             validator: (value) => value!.isEmpty ? '사용자 이름을 입력해주세요' : null,
//             onSaved: (value) => username = value!,
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: '비밀번호'),
//             obscureText: true,
//             validator: (value) => value!.isEmpty ? '비밀번호를 입력해주세요' : null,
//             onSaved: (value) => password = value!,
//           ),
//           ElevatedButton(
//             onPressed: state is ,
//             child: Text('로그인'),
//           ),
//         ],
//       ),
//     );
//   }
// }
