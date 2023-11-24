import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mogu_web/common/layout/default_layout.dart';
import 'package:mogu_web/main_page/component/contest_card.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login_page/view/login_page_view.dart';
import '../viewModel/contest_model_view_model.dart';
import 'package:mogu_web/login_page/viewModel/auth_view_model.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contestModelList = ref.watch(contestModelProvider);
     final loginState = ref.watch(authViewModelProvider);

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
                onTap: () async {
                  if (loginState.loginResponse != null) {
                    // 로그인이 되어 있으면 URL을 엽니다.
                    bool launched = await launchUrl(Uri.parse(contest.url));
                    if (!launched) {
                      throw 'Could not launch ${contest.url}';
                    }
                  } else {
                    // 로그인이 되어 있지 않으면 로그인 페이지를 띄웁니다.
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => LoginPage(),
                    );
                  }
                },
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
