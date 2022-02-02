import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_app/base/base.dart';
import 'package:github_app/bloc/home_bloc/home_bloc_cubit.dart';
import 'package:github_app/utils/app_bloc_observer.dart';
import 'package:github_app/utils/get_it_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/utils/helper.dart';

void main() async {
  await setupDepedencyInjection();
  BlocOverrides.runZoned(
    () => runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    )),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final newTextTheme = Theme.of(context).textTheme.apply(
    //       fontFamily: C.font.notoSans,
    //     );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBlocCubit(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        theme: ThemeData(
          primarySwatch: Helper.func.createMaterialColor(C.color.baliHai),
          splashColor: C.color.blumine.withOpacity(0.4),
          scaffoldBackgroundColor: Colors.white,
          // textTheme: newTextTheme,
          outlinedButtonTheme: T.button.outlineButtonTheme,
          elevatedButtonTheme: T.button.elevatedButtonTheme,
          inputDecorationTheme: T.decor.input,
        ),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: const Scaffold(),
      ),
    );
  }
}
