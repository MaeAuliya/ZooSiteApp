import 'package:flutter/material.dart';

import '../../../../core/enums/classification_model_type.dart';
import '../../../../core/enums/image_picker_type.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';


class ModelBottomSheet extends StatelessWidget {
  final Function(ClassificationModelType) onTap;
  final ClassificationModelType currentModel;

  const ModelBottomSheet({
    super.key,
    required this.onTap,
    required this.currentModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: context.heightScale * 32,
        horizontal: context.widthScale * 32,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        color: Colors.white,
      ),
      child: Column(
        spacing: context.heightScale * 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          CoreTypography.coreText(
            text: 'Pilih Model',
            color: Colours.darkGreenColor,
            fontWeight: CoreTypography.bold,
            fontSize: 20,
          ),
          Divider(
            color: Colours.greyColor,
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: context.heightScale * 12),
            child: GestureDetector(
              onTap: () {
                onTap(ClassificationModelType.kusumo);
              },
              child: CoreTypography.coreText(
                text: 'Inception NET V3 (Kusumo, 2023)',
                fontSize: (currentModel == ClassificationModelType.kusumo) ? 15 : 14,
                fontWeight: (currentModel == ClassificationModelType.kusumo) ? CoreTypography.semiBold : CoreTypography.medium,
                color: (currentModel == ClassificationModelType.kusumo) ? Colours.darkGreenColor : Colours.blackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: context.heightScale * 12),
            child: GestureDetector(
              onTap: () {
                onTap(ClassificationModelType.auliya);
              },
              child: CoreTypography.coreText(
                text: 'Mobile NET V3 (Auliya, 2024)',
                fontSize: (currentModel == ClassificationModelType.auliya) ? 15 : 14,
                fontWeight: (currentModel == ClassificationModelType.auliya) ? CoreTypography.semiBold : CoreTypography.medium,
                color: (currentModel == ClassificationModelType.auliya) ? Colours.darkGreenColor : Colours.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
