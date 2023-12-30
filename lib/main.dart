import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:resturentapp/local_storage/cart/car_hive_controller.dart';
import 'package:resturentapp/local_storage/cart/cartmodel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resturentapp/view/flash/flashScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();

  Hive.registerAdapter(HiveCartModelAdapter());
  HiveCartController.openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lee House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "themeFont",
      ),
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', 'Hant'),
      ],
      locale: const Locale('zh', 'Hant'),

      home: const FlashScreen(),
    );
  }
}

class AppLocalizations {
}
