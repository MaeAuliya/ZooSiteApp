import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/home/presentation/providers/home_provider.dart';
import '../../features/image_classification/presentation/bloc/classification_bloc.dart';
import '../../features/image_classification/presentation/providers/classification_provider.dart';

extension ContextExtension on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);

  // Responsiveness
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  // Frame width from Figma
  double get _designWidth => 430;

  // Frame height from Figma
  double get _designHeight => 932;

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  double get widthScale => width / _designWidth;

  double get heightScale => height / _designHeight;

  double get topSafe => MediaQuery.paddingOf(this).top;

  // Blocs
  HomeBloc get homeBloc => read<HomeBloc>();
  ClassificationBloc get classificationBloc => read<ClassificationBloc>();

  // Providers
  HomeProvider get homeProvider => read<HomeProvider>();
  ClassificationProvider get classificationProvider => read<ClassificationProvider>();

  // Navigator
  // if you using bottom navigator controller
  // NavigationController get bottomNavigator => read<NavigationController>();
}
