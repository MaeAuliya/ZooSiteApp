import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/shared/widgets/core_dialog.dart';
import '../../../../core/shared/widgets/image_source_bottom_sheet.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../image_classification/presentation/screens/classification_screen.dart';
import '../bloc/home_bloc.dart';
import '../views/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController chatBotController = TextEditingController();
  PageController historyController = PageController(viewportFraction: 0.5);

  @override
  void initState() {
    context.homeProvider.initHome();
    context.homeBloc.add(GetAnimalHistoriesEvent());
    super.initState();
  }

  @override
  void dispose() {
    chatBotController.dispose();
    historyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is GetAnimalHistoriesError) {
            CoreUtils.debugHandler(state.runtimeType, state.errorMessage);
          } else if (state is OpenImageSourceBottomSheetSuccess) {
            showModalBottomSheet(
              context: context,
              builder: (_) => ImageSourceBottomSheet(
                onTap: (source) {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                    context,
                    ClassificationScreen.routeName,
                    arguments: source,
                  );
                },
              ),
            );
          } else if (state is OpenDialogOnConstructionSuccess) {
            showDialog(
              context: context,
              builder: (_) => CoreDialog(
                title: 'This page is under construction.',
                description: 'We\'re sorry, currently we still upgrading our features.',
              ),
            );
          } else if (state is GetAnimalHistoriesSuccess) {
            // historyController = PageController(
            //   viewportFraction: 0.5,
            //   initialPage: state.histories.length,
            // );
            context.homeProvider.initHistories(state.histories);
          }
        },
        builder: (_, state) => HomeView(
          chatBotController: chatBotController,
          historyController: historyController,
        ),
      ),
    );
  }
}
