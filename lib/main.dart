import 'package:amana/screens/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        startLocale : const Locale('ar'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amana App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primaryColor: const Color(0xff568593),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'DINNextLTArabic',
      ),
      home: LoginScreen(),
    );
  }
}

