import 'package:flutter/material.dart';
import 'package:plants_shop_app/presentation/resources/color_manager.dart';
import 'package:plants_shop_app/presentation/resources/font_manager.dart';
import 'package:plants_shop_app/presentation/resources/styles_manager.dart';
import 'package:plants_shop_app/presentation/resources/values_manager.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    // primaryColor: lightColorScheme.primary,
    useMaterial3: true,
    colorScheme: lightColorScheme,

    // ? cardviw theme
    cardTheme: CardTheme(
        color: lightColorScheme.surface,
        shadowColor: lightColorScheme.shadow,
        elevation: AppSize.s1_5),
    // ? app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: lightColorScheme.background,
        shadowColor: lightColorScheme.shadow,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s24, color: lightColorScheme.onPrimary)),

    // ? text button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightColorScheme.onBackground,
        textStyle: getMediumStyle(
          color: lightColorScheme.onBackground,
          fontSize: FontSize.s19,
        ),
      ),
    ),

    // ?button theme
    buttonTheme: ButtonThemeData(
        disabledColor: lightColorScheme.inversePrimary,
        buttonColor: lightColorScheme.primary),

    // ?elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          color: lightColorScheme.primary,
          fontSize: FontSize.s26,
        ),
        // backgroundColor: lightColorScheme.error,
      ),
    ),

    //? text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: lightColorScheme.onBackground, fontSize: FontSize.s32),
        titleMedium: getMediumStyle(
            color: lightColorScheme.primary, fontSize: FontSize.s18),
        titleSmall: getMediumStyle(
            color: lightColorScheme.onBackground, fontSize: FontSize.s14),
        titleLarge: getMediumStyle(
            color: lightColorScheme.onBackground, fontSize: FontSize.s18),
        bodySmall: getMediumStyle(
            color: lightColorScheme.outlineVariant, fontSize: FontSize.s15),
        bodyLarge: getMediumStyle(
            color: lightColorScheme.onBackground, fontSize: FontSize.s30),
        headlineLarge: getMediumStyle(
            color: lightColorScheme.onPrimary, fontSize: FontSize.s40),
        headlineMedium: getMediumStyle(
            color: lightColorScheme.onPrimaryContainer,
            fontSize: FontSize.s22)),

    // ?input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // ? content padding
      contentPadding: const EdgeInsets.all(AppPadding.p10),

      // ? text field background color
      filled: true,
      fillColor: lightColorScheme.primaryContainer,

      // ? hint style
      hintStyle: getRegularStyle(
          color: lightColorScheme.secondary, fontSize: FontSize.s12),

      // ? label style
      labelStyle: getMediumStyle(
          color: lightColorScheme.secondary, fontSize: FontSize.s12),

      // ? error style
      errorStyle: getRegularStyle(color: lightColorScheme.error),

      // ? enabel border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: lightColorScheme.primaryContainer, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
      ),

      // ? focused border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: lightColorScheme.primaryContainer, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
      ),

      // ? error border style
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? focused  error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: lightColorScheme.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),
    ),
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,

    // ? cardviw theme
    cardTheme: CardTheme(
        color: darkColorScheme.surface,
        shadowColor: darkColorScheme.shadow,
        elevation: AppSize.s1_5),
    // ? app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: darkColorScheme.background,
        shadowColor: darkColorScheme.shadow,
        titleTextStyle: getRegularStyle(
            fontSize: FontSize.s24, color: darkColorScheme.onPrimary)),

    // ? text button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkColorScheme.onBackground,
        textStyle: getMediumStyle(
          color: darkColorScheme.onBackground,
          fontSize: FontSize.s19,
        ),
      ),
    ),

    // ?button theme
    buttonTheme: ButtonThemeData(
        disabledColor: darkColorScheme.inversePrimary,
        buttonColor: darkColorScheme.primary),

    // ?elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          color: darkColorScheme.primary,
          fontSize: FontSize.s26,
        ),
        // backgroundColor: darkColorScheme.error,
      ),
    ),

    //? text theme
    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: darkColorScheme.secondary,
          fontSize: FontSize.s30,
        ),
        titleMedium: getMediumStyle(
            color: darkColorScheme.primary, fontSize: FontSize.s18),
        titleSmall: getMediumStyle(
            color: darkColorScheme.primary, fontSize: FontSize.s18),
        titleLarge: getMediumStyle(
            color: darkColorScheme.onSurface, fontSize: FontSize.s18),
        bodySmall: getMediumStyle(
            color: darkColorScheme.outlineVariant, fontSize: FontSize.s15),
        bodyLarge: getMediumStyle(
            color: darkColorScheme.onBackground, fontSize: FontSize.s30),
        headlineLarge: getMediumStyle(
            color: darkColorScheme.onPrimary, fontSize: FontSize.s40),
        headlineMedium: getMediumStyle(
            color: darkColorScheme.onPrimaryContainer, fontSize: FontSize.s22)),

    // ?input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // ? content padding
      contentPadding: const EdgeInsets.all(AppPadding.p10),

      // ? hint style
      hintStyle: getRegularStyle(
          color: darkColorScheme.secondary, fontSize: FontSize.s16),

      // ? label style
      labelStyle: getMediumStyle(
          color: darkColorScheme.secondary, fontSize: FontSize.s16),

      // ? error style
      errorStyle: getRegularStyle(color: darkColorScheme.error),

      // ? enabel border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: darkColorScheme.secondary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? focused border style
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: darkColorScheme.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? error border style
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: darkColorScheme.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),

      // ? focused  error border style
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: darkColorScheme.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s18)),
      ),
    ),
  );
}
