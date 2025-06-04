import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class ClassificationUniqueView extends StatelessWidget {
  final String name;
  final String uniqueFact;

  const ClassificationUniqueView({
    super.key,
    required this.uniqueFact,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.heightScale * 4,
      children: [
        CoreTypography.coreText(
          text: name,
          fontWeight: CoreTypography.bold,
          fontSize: 24,
          textAlign: TextAlign.center,
          color: Colours.darkGreenColor,
        ),
        CoreTypography.coreText(
          text: '" $uniqueFact "',
          fontSize: 13,
          fontStyle: FontStyle.italic,
          fontWeight: CoreTypography.medium,
          textAlign: TextAlign.center,
          maxLine: 10,
        ),
      ],
    );
  }
}
