import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'src/core/services/dependency_injection/injection_container.dart';
import 'src/features/home/presentation/screens/splash_screen.dart';

import 'src/core/res/app_theme.dart';
import 'src/core/services/routers/router.dart';
import 'src/features/home/presentation/providers/home_provider.dart';
import 'src/features/image_classification/presentation/providers/classification_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Init Dependencies
  await initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ClassificationProvider()),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
        title: 'ZooSite',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: generateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
