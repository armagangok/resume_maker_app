import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  void dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  Future<void> cupertinoDialog({
    required Widget widget,
    bool barrierDismissible = true,
  }) async {
    await showCupertinoDialog(
      barrierDismissible: barrierDismissible,
      context: this,
      builder: (_) => widget,
    );
  }

  Future<void> bottomSheet(
      {Widget widget = const SizedBox(),
      bool isScrollControlled = false,
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )}) async {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      isScrollControlled: isScrollControlled,
      context: this,
      builder: (_) => widget,
    );
  }
}

extension EasySize on BuildContext {
  double get dynamicHeight => mediaQuery.size.height;
  double get dynamicWidth => mediaQuery.size.width;

  double height(double value) => dynamicHeight * value;
  double width(double value) => dynamicWidth * value;

  double get lowWidth => dynamicWidth * 0.015;
  double get normalWidth => dynamicWidth * 0.025;
  double get mediumWidth => dynamicWidth * 0.035;
  double get bigWidth => dynamicWidth * 0.05;

  double get lowHeight => dynamicWidth * 0.015;
  double get normalHeight => dynamicHeight * 0.025;
  double get mediumHeight => dynamicHeight * 0.035;
  double get bigHeight => dynamicWidth * 0.05;
}

extension EasyTheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primary => colors.primary;
  Color get backgroundColor => theme.colorScheme.background;
  ColorScheme get colors => theme.colorScheme;
  IconThemeData get iconTheme => theme.iconTheme;
}

extension EasyPadding on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowWidth);
  EdgeInsets get normalPadding => EdgeInsets.all(normalWidth);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumWidth);
  EdgeInsets get bigPadding => EdgeInsets.all(bigWidth);
  EdgeInsets padding(double ratio) => EdgeInsets.all(ratio * dynamicWidth);

  EdgeInsets symmetricPadding({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      EdgeInsets.symmetric(
        horizontal: width(1.0) * horizontal,
        vertical: height(1.0) * vertical,
      );

  EdgeInsets only({
    double right = 0.0,
    double left = 0.0,
    double top = 0.0,
    double bottom = 0.0,
  }) =>
      EdgeInsets.only(
        left: left * dynamicWidth,
        right: right * dynamicWidth,
        bottom: bottom * dynamicHeight,
        top: top * dynamicHeight,
      );
}

extension EasyText on BuildContext {
  TextTheme get textTheme => theme.textTheme;
  TextStyle get titleSmall => theme.textTheme.titleSmall!;
  TextStyle get titleMedium => theme.textTheme.titleMedium!;
  TextStyle get titleLarge => theme.textTheme.titleLarge!;
  TextStyle get bodyLarge => theme.textTheme.bodyLarge!;
  TextStyle get bodyMedium => theme.textTheme.bodyMedium!;
  TextStyle get bodySmall => theme.textTheme.bodySmall!;
  TextStyle get headlineMedium => theme.textTheme.headlineMedium!;
  TextStyle get headlineSmall => theme.textTheme.headlineMedium!;
  TextStyle get displayLarge => theme.textTheme.displayLarge!;
  TextStyle get displayMedium => theme.textTheme.displayMedium!;
  TextStyle get displaySmall => theme.textTheme.displaySmall!;
}
