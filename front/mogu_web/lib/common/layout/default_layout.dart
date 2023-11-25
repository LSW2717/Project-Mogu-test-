import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mogu_web/login_page/viewModel/auth_view_model.dart';
import 'package:go_router/go_router.dart';
class DefaultLayout extends ConsumerWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? appBar;
  final Widget? bottomNavigationBar;

  const DefaultLayout({
    required this.child,
    this.backgroundColor,
    this.title,
    this.appBar,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: defaultAppBar(authState.user?.name),
      body:child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? defaultAppBar(String? userName){
    if(title == null){
      return null;
    }else{
      return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 33 - 16, bottom: 10),
              child: Text(
                'mogu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 33 - 16, bottom: 10),
              child: Text(
                userName != null ? "$userName님" : "로그인",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF005BAC),
        toolbarHeight: 76,
      );
    }
  }
}
