import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../providers/home_provider.dart';
import 'home_chat_bot_view.dart';
import 'home_header_view.dart';
import 'home_history_view.dart';

class HomeView extends StatelessWidget {
  final TextEditingController chatBotController;
  final PageController historyController;

  const HomeView({
    super.key,
    required this.chatBotController,
    required this.historyController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: context.heightScale * 32,
          children: [
            HomeHeaderView(),
            HomeChatBotView(chatBotController: chatBotController),
            Expanded(
              child: HomeHistoryView(
                historyController: historyController,
              ),
            ),
          ],
        );
      },
    );
  }
}
