import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';

class ClassificationNameView extends StatelessWidget {
  final String accuracy;
  final String latin;
  final String time;

  const ClassificationNameView({
    super.key,
    required this.accuracy,
    required this.latin,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.widthScale * 20,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CoreTypography.coreText(
              text: 'Akurasi',
              fontSize: 14,
              fontWeight: CoreTypography.semiBold,
              color: Colours.darkGreenColor,
            ),
            CoreTypography.coreText(
              text: accuracy,
            ),
          ],
        ),
        Container(
          height: context.height * 0.05,
          width: 1,
          color: Colours.greyTextFieldStrokeColor,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * 0.4),
          child: Column(
            children: [
              CoreTypography.coreText(
                text: 'Nama Latin',
                fontSize: 14,
                fontWeight: CoreTypography.semiBold,
                color: Colours.darkGreenColor,
              ),
              CoreTypography.coreText(
                text: latin,
                fontStyle: FontStyle.italic,
                maxLine: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          height: context.height * 0.05,
          width: 1,
          color: Colours.greyTextFieldStrokeColor,
        ),
        Column(
          children: [
            CoreTypography.coreText(
              text: 'Time',
              fontSize: 14,
              fontWeight: CoreTypography.semiBold,
              color: Colours.darkGreenColor,
            ),
            CoreTypography.coreText(
              text: time,
            ),
          ],
        )
      ],
    );
  }
}
