import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../providers/home_provider.dart';
import '../widgets/home_history_item.dart';

class HomeHistoryView extends StatelessWidget {
  final PageController historyController;

  const HomeHistoryView({
    super.key,
    required this.historyController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        if (provider.animalHistories == null) {
          return LoadingView();
        }
        return Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: SvgPicture.asset(
                MediaRes.leaf3Vectors,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                MediaRes.leaf4Vectors,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: context.heightScale * 12,
                ),
                child: Column(
                  spacing: context.heightScale * 12,
                  children: [
                    CoreTypography.coreText(
                      text: 'Pengetahuan Terbaru Mu',
                      fontSize: 20,
                      fontWeight: CoreTypography.semiBold,
                      color: Colours.blackColor,
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: historyController,
                        itemCount: provider.animalHistories!.length,
                        onPageChanged: (index) => provider.updateHistory(index),
                        itemBuilder: (_, index) {
                          return AnimatedBuilder(
                            animation: historyController,
                            builder: (context, child) {
                              double currentPage = historyController.page ??
                                  historyController.initialPage.toDouble();

                              double distance = (currentPage - index).abs();

                              double scale = 1 - (distance * 0.3).clamp(0.0, 0.3);
                              double opacity = 1 - (distance * 0.5).clamp(0.0, 0.5);

                              return Opacity(
                                opacity: opacity,
                                child: Transform.scale(
                                  scale: scale,
                                  child: child,
                                ),
                              );
                            },
                            child: HomeHistoryItem(
                              id: index,
                              currentId: provider.currentHistory.floor(),
                              image: provider.animalHistories![index].image,
                              name: provider.animalHistories![index].name,
                              scienceName: provider.animalHistories![index].scienceName,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
