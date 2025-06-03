import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class HomeHistoryItem extends StatelessWidget {
  final int id;
  final int currentId;
  final String image;
  final String name;
  final String scienceName;

  const HomeHistoryItem({
    super.key,
    required this.id,
    required this.currentId,
    required this.image,
    required this.name,
    required this.scienceName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withValues(alpha: 0.25),
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: context.heightScale * 245,
              width: (id == currentId) ? context.heightScale * 300 : context.heightScale * 200,
              fit: BoxFit.fill,
            ),
          ),
        ),
        (currentId == id)
            ? Column(
                children: [
                  SizedBox(
                    height: context.heightScale * 12,
                  ),
                  CoreTypography.coreText(
                    text: name,
                    fontWeight: CoreTypography.bold,
                    fontSize: 16,
                    color: Colours.blackColor,
                  ),
                  CoreTypography.coreText(
                    text: scienceName,
                    fontWeight: CoreTypography.medium,
                    fontSize: 14,
                    color: Colours.blackColor,
                  ),
                ],
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
