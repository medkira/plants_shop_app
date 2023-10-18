import 'package:flutter/material.dart';
import 'package:plants_shop_app/presentation/resources/routes_manager.dart';
import 'package:plants_shop_app/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.onboarding,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getApplicationLightTheme(),
      darkTheme: getApplicationDarkTheme(),
      themeMode: ThemeMode
          .light, // todo add a button to swap between dark and light theme
    );
  }
}


// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return FlutterSizer(builder: (context, orientation, creenType) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         initialRoute: Routes.onboarding,
//         onGenerateRoute: RouteGenerator.getRoute,
//         theme: getApplicationLightTheme(),
//         darkTheme: getApplicationDarkTheme(),
//         themeMode: ThemeMode
//             .light, // todo add a button to swap between dark and light theme
//       );
//     });
//   }
// }
