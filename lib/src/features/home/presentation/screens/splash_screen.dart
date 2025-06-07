import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/res/media_res.dart';
import '../bloc/home_bloc.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.homeBloc.add(MoveToHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) async {
          if (state is MoveToHomeSuccess) {
            await Future.delayed(Duration(seconds: 2), (){
              if (!context.mounted) return;
              Navigator.pushNamed(context, HomeScreen.routeName);
            });
          }
        },
        child: Image.asset(
          MediaRes.splashScreenBg,
          width: context.width,
          height: context.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
