import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: defaultAppBar(),
      body:child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? defaultAppBar(){
    if(title == null){
      return null;
    }else{
      return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF005BAC),
        toolbarHeight: 76,
      );
    }
  }
}
