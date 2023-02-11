import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilHelper {
  ScreenUtilHelper._();

  static Future<void> ensureInitialized() async {
    await ScreenUtil.ensureScreenSize();
  }

  static ScreenUtilInit screenUtilInit(MaterialApp materialApp) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (context, child) => materialApp,
    );
  }
}
