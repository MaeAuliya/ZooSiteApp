import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/home/presentation/screens/splash_screen.dart';
import '../../../features/image_classification/presentation/bloc/classification_bloc.dart';
import '../../../features/image_classification/presentation/screens/classification_screen.dart';
import '../../enums/image_picker_type.dart';
import '../../shared/screens/page_under_construction.dart';
import '../dependency_injection/injection_container.dart';

part 'router_main.dart';
