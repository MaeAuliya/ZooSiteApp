import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../res/colours.dart';
import '../../res/typography.dart';

class CoreDialog extends StatelessWidget {
  const CoreDialog({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        Navigator.pop(context);
      },
      child: Dialog(
        surfaceTintColor: Colours.whiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: context.heightScale * 32, horizontal: context.widthScale * 24),
          decoration: BoxDecoration(
            color: Colours.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: context.heightScale * 12,
            children: [
              CoreTypography.coreText(
                text: title,
                textAlign: TextAlign.center,
                fontWeight: CoreTypography.bold,
                fontSize: 20,
                color: Colours.darkGreenColor,
                maxLine: 2,
              ),
              CoreTypography.coreText(
                text: description,
                textAlign: TextAlign.center,
                fontWeight: CoreTypography.regular,
                color: Colours.blackColor,
                fontSize: 14,
                maxLine: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
