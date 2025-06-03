import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/widgets/core_text_field.dart';

class HomeChatBotView extends StatelessWidget {
  final TextEditingController chatBotController;

  const HomeChatBotView({
    super.key,
    required this.chatBotController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoreTypography.coreText(
          text: 'Kenali Keindahan Alam',
          fontWeight: CoreTypography.medium,
          color: Colours.blackColor,
          fontSize: 20,
        ),
        CoreTypography.coreText(
          text: 'Dengan ChatBot kami',
          color: Colours.blackColor,
        ),
        SizedBox(
          height: context.heightScale * 8,
        ),
        SizedBox(
          width: context.width * 0.8,
          child: CoreTextField(
            controller: chatBotController,
            filled: true,
            fillColor: Colours.primaryColor.withValues(alpha: 0.15),
            borderColor: Colours.greyTextFieldStrokeColor,
            hintText: 'Tanya kami apa saja!',
            suffixIcon: Icon(
              Icons.search,
              color: Colours.hintColor,
            ),
          ),
        )
      ],
    );
  }
}
