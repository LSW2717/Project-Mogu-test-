import 'package:flutter/material.dart';
import 'common/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(child: MoguWeb()), // ProviderScope 추가
  );
}

class MoguWeb extends StatelessWidget {
  const MoguWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mogu Web Page',
      routerConfig: router,
    );
  }
}
