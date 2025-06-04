import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/colours.dart';
import '../../res/typography.dart';

class CoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoreAppBar({
    super.key,
    required this.title,
    this.icon,
    this.child,
    this.size = 20,
    this.isBackButton = true,
    this.centerTitle = true,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.statusBarIconColor = Brightness.dark,
  });

  final Icon? icon;
  final String title;
  final Widget? child;
  final double? size;
  final bool? isBackButton;
  final bool centerTitle;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Brightness statusBarIconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusBarIconColor,
      ),
      actions: [
        child != null
            ? Padding(
                padding: const EdgeInsets.only(right: 16),
                child: child,
              )
            : const SizedBox.shrink(),
      ],
      toolbarHeight: 70,
      leadingWidth: 70,
      surfaceTintColor: Colours.whiteColor,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? (title == "" ? Colors.transparent : Colours.whiteColor),
      foregroundColor: foregroundColor ?? Colours.blackColor,
      elevation: 0,
      leading: isBackButton == true
          ? IconButton(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 1),
              icon: icon ??
                  Icon(
                    Icons.arrow_back_rounded,
                    color: foregroundColor ?? Colours.blackColor,
                    size: 20,
                  ),
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : const SizedBox.shrink(),
      title: CoreTypography.coreText(
          text: title,
          fontWeight: CoreTypography.bold,
          fontSize: size ?? 20,
          color: foregroundColor ?? Colours.blackColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
