import 'package:flutter/material.dart';

import '../../enums/image_picker_type.dart';
import '../../extensions/context_extension.dart';
import '../../res/colours.dart';
import '../../res/typography.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  final Function(String) onTap;

  const ImageSourceBottomSheet({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        vertical: context.heightScale * 24,
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
            text: 'Ambil Gambar Lewat',
            color: Colours.darkGreenColor,
            fontWeight: CoreTypography.bold,
            fontSize: 20,
          ),
          Divider(
            color: Colours.greyColor,
          ),
          SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                spacing: context.heightScale * 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTap(ImagePickerTypeEnums.camera);
                    },
                    child: Container(
                      height: context.widthScale * 64,
                      width: context.widthScale * 64,
                      decoration: BoxDecoration(
                        gradient: Colours.primaryGradient,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colours.darkGreenColor),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black.withValues(alpha: 0.25),
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(context.widthScale * 8),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colours.whiteColor,
                        size: context.widthScale * 32,
                      ),
                    ),
                  ),
                  CoreTypography.coreText(
                    text: 'Kamera',
                    fontSize: 14,
                    fontWeight: CoreTypography.medium,
                    color: Colours.darkGreenColor,
                  ),
                ],
              ),
              Column(
                spacing: context.heightScale * 8,
                children: [
                  GestureDetector(
                    onTap: () {
                      onTap(ImagePickerTypeEnums.gallery);
                    },
                    child: Container(
                      height: context.widthScale * 64,
                      width: context.widthScale * 64,
                      decoration: BoxDecoration(
                        gradient: Colours.primaryGradient,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colours.darkGreenColor),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black.withValues(alpha: 0.25),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(context.widthScale * 8),
                      child: Icon(
                        Icons.image_outlined,
                        color: Colours.whiteColor,
                        size: context.widthScale * 32,
                      ),
                    ),
                  ),
                  CoreTypography.coreText(
                    text: 'Gallery',
                    fontSize: 14,
                    fontWeight: CoreTypography.medium,
                    color: Colours.darkGreenColor,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
