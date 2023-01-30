import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_maker_app/core/extension/context_extension.dart';

abstract class TabBarContract {
  int get getIndex;
  set setIndex(int index);
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required this.widgetList,
  }) : super(key: key);

  final List<Widget> widgetList;

  @override
  Widget build(BuildContext context) => expandedItems();

  Widget expandedItems() => Builder(
        builder: (context) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Row(
            children: widgetList,
          ),
        ),
      );

  Widget get width => Builder(
        builder: (context) {
          return SizedBox(
            width: context.width(0.08),
          );
        },
      );
}

class ExpandedItem extends ConsumerWidget {
  const ExpandedItem({
    Key? key,
    required this.text,
    this.textStyle,
    required this.clickedNumber,
    this.iconData,
    required this.onTap,
    // required this.tabControler,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final int clickedNumber;
  final IconData? iconData;
  final Function onTap;
  // final TabBarContract tabControler;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Builder(
        builder: (context) {
          var tabBar = ref.watch(tabBarProvider);
          return GestureDetector(
            onTap: () => onTap(),
            child: Padding(
              padding: context.only(right: 0.05),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: context.width(0.005),
                          color: clickedNumber == tabBar.getIndex
                              ? context.primary
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: textStyle ??
                          TextStyle(
                            color: clickedNumber == tabBar.getIndex
                                ? Colors.white
                                : Colors.grey,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}

// ignore_for_file: prefer_final_fields

final tabBarProvider = ChangeNotifierProvider<TabBarProvider>(
  (ref) => TabBarProvider(),
);

class TabBarProvider extends ChangeNotifier implements TabBarContract {
  int _index = 0;
  @override
  set setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  @override
  int get getIndex => _index;
}
