import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/theme/theme_data/dark_theme.dart';

import 'core/navigation/constant/routes.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: CustomThemeData.darkTheme,
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          initialRoute: homePage,
        );
      },
    );
  }
}
