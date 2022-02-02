import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/ui/pokemon/pokemon_page.dart';
import 'package:github_app/utils/get_it_config.dart';
import 'package:github_app/utils/helper.dart';

void main() async {
  await setupDepedencyInjection();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      theme: ThemeData(
        primarySwatch: Helper.func.createMaterialColor(C.color.baliHai),
        splashColor: C.color.blumine.withOpacity(0.4),
        // textTheme: newTextTheme,
        outlinedButtonTheme: T.button.outlineButtonTheme,
        elevatedButtonTheme: T.button.elevatedButtonTheme,
        inputDecorationTheme: T.decor.input,
      ),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const PokemonPage(),
    );
  }
}
