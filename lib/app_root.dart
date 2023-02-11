import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/theme/theme_data/dark_theme.dart';
import 'package:resume_maker_app/core/util/screen_util_helper/screen_util.dart';

import 'core/navigation/constant/routes.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilHelper.screenUtilInit(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: CustomThemeData.darkTheme,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          initialRoute: rootPage,
        ),
      );
}
