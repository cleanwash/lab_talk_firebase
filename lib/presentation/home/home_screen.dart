import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab_talk_firebase/core/components/floating_action_buttom_custom.dart';
import 'package:lab_talk_firebase/core/util/routing/router_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButtomCustom(
        texts: ['물건찾기', '문의하기', '논문점수'],
        icons: [
          const Icon(Icons.search),
          const Icon(Icons.question_answer),
          const Icon(Icons.scoreboard),
        ],
        color: Colors.blue, // 원하는 색상 지정
        onPressed: (index) {
          switch (index) {
            case 0:
              context.go(RouterPath.createItem);
              break;
            case 1:
              context.go('/domestic-search');
              break;
            case 2:
              context.go('/lab-tips');
              break;
          }
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
