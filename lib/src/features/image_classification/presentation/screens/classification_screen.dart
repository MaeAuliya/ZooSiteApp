import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../../../core/enums/classification_model_type.dart';
import '../../../../core/enums/image_picker_type.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/shared/widgets/core_app_bar.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../data/models/image_classification_params_model.dart';
import '../bloc/classification_bloc.dart';
import '../views/classification_view.dart';
import '../widgets/model_bottom_sheet.dart';

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
  final isDialOpen = ValueNotifier(false);

  @override
  void initState() {
    context.classificationProvider.init();
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
        appBar: CoreAppBar(
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
                  (_) => false,
            );
          },
          title:
              (context.homeProvider.currentHeader == 2) ? 'Klasifikasi Ikan' : 'Klasifikasi Hewan',
          backgroundColor: Colours.primaryColor,
          foregroundColor: Colours.whiteColor,
          statusBarIconColor: Brightness.light,
          child: (context.homeProvider.currentHeader == 2)
              ? null
              : IconButton(
                  onPressed: () {
                    context.classificationBloc.add(ShowModelBottomSheetEvent());
                  },
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colours.whiteColor,
                    size: 20,
                  ),
                ),
        ),
        floatingActionButton: SpeedDial(
          openCloseDial: isDialOpen,
          backgroundColor: Colours.primaryColor,
          overlayColor: Colours.blackColor,
          overlayOpacity: 0.3,
          icon: Icons.replay,
          activeIcon: Icons.close_rounded,
          activeBackgroundColor: Colours.errorColor,
          spaceBetweenChildren: 10,
          closeManually: true,
          children: [
            SpeedDialChild(
              onTap: () {
                isDialOpen.value = false;
                context.classificationBloc.add(TakeImageEvent((ImagePickerTypeEnums.camera)));
              },
              labelBackgroundColor: Colours.primaryColor,
              shape: const CircleBorder(),
              backgroundColor: Colours.primaryColor,
              child: Icon(
                Icons.camera_alt_outlined,
                color: Colours.whiteColor,
                size: 20,
              ),
            ),
            SpeedDialChild(
              onTap: () {
                isDialOpen.value = false;
                context.classificationBloc.add(TakeImageEvent((ImagePickerTypeEnums.gallery)));
              },
              shape: const CircleBorder(),
              backgroundColor: Colours.primaryColor,
              child: Icon(
                Icons.image_outlined,
                color: Colours.whiteColor,
                size: context.widthScale * 32,
              ),
            ),
          ],
        ),
        body: BlocListener<ClassificationBloc, ClassificationState>(
          listener: (context, state) {
            CoreUtils.debugHandler(state.runtimeType, '');
            if (state is TakeImageError) {
              CoreUtils.debugHandler(state.runtimeType, state.errorMessage);
            } else if (state is ClassifyImageError) {
              CoreUtils.debugHandler(state.runtimeType, state.errorMessage);
            } else if (state is TakeImageFailed) {
              if (context.classificationProvider.image == null) {
                Navigator.pop(context);
              }
            } else if (state is TakeImageSuccess) {
              context.classificationProvider.updateImage(state.image);
              final currentModel = (context.homeProvider.currentHeader == 2)
                  ? context.classificationProvider.fishModel
                  : context.classificationProvider.currentAnimalModel ??
                      ClassificationModelType.kusumo;
              final params = ImageClassificationParamsModel(
                image: state.image,
                modelName: currentModel,
                resizeTo: ClassificationModelTypeEnums.getModelShape(currentModel),
              );
              context.classificationBloc.add(ClassifyImageEvent(params));
            } else if (state is ClassifyImageSuccess) {
              context.classificationProvider.updateAnimal(state.animal);
            } else if (state is ShowModelBottomSheetSuccess) {
              showModalBottomSheet(
                context: context,
                builder: (_) => ModelBottomSheet(
                  currentModel: context.classificationProvider.currentAnimalModel!,
                  onTap: (model){
                    context.classificationProvider.updateModel(model);
                    final params = ImageClassificationParamsModel(
                      image: context.classificationProvider.image!,
                      modelName: model,
                      resizeTo: ClassificationModelTypeEnums.getModelShape(model),
                    );
                    context.classificationBloc.add(ClassifyImageEvent(params));
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          child: ClassificationView(),
        ),
      ),
    );
  }
}
