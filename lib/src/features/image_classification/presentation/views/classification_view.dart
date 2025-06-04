import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/typography.dart';
import '../../../../core/shared/views/loading_view.dart';
import '../bloc/classification_bloc.dart';
import '../providers/classification_provider.dart';
import 'classification_name_view.dart';
import 'classification_unique_view.dart';

class ClassificationView extends StatelessWidget {

  const ClassificationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassificationBloc, ClassificationState>(
      builder: (_, state) => Consumer<ClassificationProvider>(
        builder: (_, provider, __) {
          if (provider.animal == null) {
            return LoadingView();
          } else if (state is ClassifyImageLoading) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: context.heightScale * 16,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colours.primaryColor,
                    ),
                  ),
                ),
                CoreTypography.coreText(
                  text: 'Identify Your Photos...',
                  color: Colours.darkGreenColor,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                  fontWeight: CoreTypography.semiBold,
                  maxLine: 3,
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(context.widthScale * 24),
                child: Column(
                  spacing: context.heightScale * 24,
                  children: [
                    ClassificationNameView(
                      accuracy: '${(provider.animal!.accuration * 100).toStringAsFixed(3)} %',
                      latin: provider.animal!.scienceName,
                      time: '${provider.animal!.computeTime.toStringAsFixed(3)} s',
                    ),
                    Container(
                      width: context.width,
                      height: context.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        child: Image.file(
                          File(provider.image!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    ClassificationUniqueView(
                      name: provider.animal!.name,
                      uniqueFact: provider.animal!.uniqueFact,
                    ),
                    CoreTypography.coreText(
                      text: provider.animal!.description,
                      maxLine: 20,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
