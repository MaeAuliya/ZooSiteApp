import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';

class HomeHeaderButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isNext;

  const HomeHeaderButton({
    super.key,
    required this.onTap,
    required this.isNext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(context.widthScale * 8),
        width: context.widthScale * 48,
        height: context.widthScale * 48,
        decoration: BoxDecoration(
          color: Colours.darkGreenColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.25),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Icon(
          isNext ? Icons.arrow_forward_rounded : Icons.arrow_back_outlined,
          color: Colours.whiteColor,
          size: 18,
        ),
      ),
    );
  }
}
