part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<HomeBloc>(),
          child: const SplashScreen(),
        ),
        settings: settings,
      );
    case HomeScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<HomeBloc>(),
          child: const HomeScreen(),
        ),
        settings: settings,
      );
    case ClassificationScreen.routeName:
      final imageSource = settings.arguments as String? ?? ImagePickerTypeEnums.camera;
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<ClassificationBloc>(),
          child: ClassificationScreen(imageSource: imageSource),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings? settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, _, __) => page(context),
    barrierDismissible: false,
  );
}
