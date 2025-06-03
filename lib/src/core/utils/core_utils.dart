import 'dart:developer';

import 'package:flutter/cupertino.dart';

class CoreUtils {
  const CoreUtils._();

  // Always using 'static' Functions here
  static String exampleFunction() => '';

  static void debugHandler(Type stateType, String errorMessage){
    debugPrint('Error di : $stateType, message: $errorMessage');
  }
}