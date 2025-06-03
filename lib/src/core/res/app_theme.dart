import 'package:flutter/material.dart';

import 'colours.dart';
import 'fonts.dart';

ThemeData theme() => ThemeData(
    scaffoldBackgroundColor: Colours.whiteColor,
    fontFamily: Fonts.jakartaSans,
    primaryColor: Colours.primaryColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
        accentColor: Colours.primaryColor,
        errorColor: Colours.errorColor
    )
);