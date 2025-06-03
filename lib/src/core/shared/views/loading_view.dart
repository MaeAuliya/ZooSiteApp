import 'package:flutter/material.dart';

import '../../res/colours.dart';

class LoadingView extends StatelessWidget {
  final bool isTransparent;
  final Color color;

  const LoadingView({
    super.key,
    this.isTransparent = false,
    this.color = Colours.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isTransparent ? Colors.black54 : color,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colours.primaryColor,
          ),
        ),
      ),
    );
  }
}
