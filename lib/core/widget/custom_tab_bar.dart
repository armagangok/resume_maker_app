// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../export/export.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({
    Key? key,
    required this.itemList,
    required this.onTap,
    required this.itemCount,
  }) : super(key: key);

  final List<Widget> itemList;
  final Function onTap;
  final int itemCount;

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Center(
        child: ListView.separated(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.itemCount,
          itemBuilder: (context, index) => InkWell(
            onTap: () => widget.onTap(index),
            child: widget.itemList[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 10.w,
          ),
        ),
      ),
    );
  }
}
