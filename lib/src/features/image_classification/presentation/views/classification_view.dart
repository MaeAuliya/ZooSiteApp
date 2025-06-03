import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../bloc/classification_bloc.dart';
import '../providers/classification_provider.dart';

class ClassificationView extends StatelessWidget {
  final ClassificationState currentState;

  const ClassificationView({
    super.key,
    required this.currentState,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ClassificationProvider>(
      builder: (_, provider, __) {
        if (currentState is ClassifyImageLoading || provider.image == null) {
          return LoadingView();
        }
        return Column(
          children: [
            Container(
              width: context.width,
              height: context.height * 0.3,
              color: Colors.red,
              child: Image.file(
                File(provider.image!),
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      },
    );
  }
}
