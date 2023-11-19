import 'package:flutter/material.dart';

import 'mainPage/view/start_page.dart';

void main() {
  runApp(MoguWeb());
}

class MoguWeb extends StatelessWidget {
  const MoguWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mogu Web Page',
      home: StartPage(),
      );
  }
}

