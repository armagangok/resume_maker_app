import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/navigation/contract/base_navigation_service.dart';

class NavigationService extends BaseNavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateTo({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigaToClear({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes,
      arguments: data,
    );
  }
}
