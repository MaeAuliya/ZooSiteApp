import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/classification_model_type.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../data/models/image_classification_params_model.dart';
import '../bloc/classification_bloc.dart';
import '../views/classification_view.dart';

class ClassificationScreen extends StatefulWidget {
  final String imageSource;

  const ClassificationScreen({
    super.key,
    required this.imageSource,
  });

  static const routeName = '/classification';

  @override
  State<ClassificationScreen> createState() => _ClassificationScreenState();
}

class _ClassificationScreenState extends State<ClassificationScreen> {
  @override
  void initState() {
    context.classificationBloc.add(TakeImageEvent(widget.imageSource));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (_) => false,
        );
      },
      child: Scaffold(
        body: BlocConsumer<ClassificationBloc, ClassificationState>(
          listener: (context, state) {
            CoreUtils.debugHandler(state.runtimeType, '');
            if (state is TakeImageError) {
              CoreUtils.debugHandler(state.runtimeType, state.errorMessage);
            } else if (state is ClassifyImageError) {
              CoreUtils.debugHandler(state.runtimeType, state.errorMessage);
            } else if (state is TakeImageFailed) {
              Navigator.pop(context);
            } else if (state is TakeImageSuccess) {
              context.classificationProvider.updateImage(state.image);
              final params = ImageClassificationParamsModel(
                image: state.image,
                modelName: ClassificationModelType.auliya,
                resizeTo: 224,
              );
              context.classificationBloc.add(ClassifyImageEvent(params));
            } else if (state is ClassifyImageSuccess) {
              debugPrint(state.animal.toString());
            }
          },
          builder: (_, state) => ClassificationView(currentState: state),
        ),
      ),
    );
  }
}
