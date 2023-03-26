// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
      height: 65.h,
      child: Center(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          scrollDirection: Axis.horizontal,
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

class ColorTabBarWidget extends StatefulWidget {
  const ColorTabBarWidget({
    Key? key,
    required this.itemList,
    required this.onTap,
    required this.itemCount,
  }) : super(key: key);

  final List<Widget> itemList;
  final Function onTap;
  final int itemCount;

  @override
  State<ColorTabBarWidget> createState() => _ColorTabBarWidgetState();
}

class _ColorTabBarWidgetState extends State<ColorTabBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Center(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          scrollDirection: Axis.horizontal,
          itemCount: widget.itemCount,
          itemBuilder: (context, index) => InkWell(
            onTap: () => widget.itemList[index] == widget.itemList.last
                ? {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: _currentColor,
                              onColorChanged: _onColorChanged,
                              showLabel: true,
                              pickerAreaHeightPercent: 0.8,
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Pick'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                    ),
                  }
                : widget.onTap(index),
            child: widget.itemList[index] == widget.itemList.last
                ? Container(
                    width: 50.h,
                    height: 50.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 0, 255),
                          Color.fromARGB(255, 0, 255, 0),
                          Color.fromARGB(255, 255, 0, 0),
                        ],
                        stops: [
                          0.1,
                          0.5,
                          1,
                        ],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  )
                : widget.itemList[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 10.w,
          ),
        ),
      ),
    );
  }

  Color _currentColor = Colors.red;

  void _onColorChanged(Color color) {
    setState(() {
      _currentColor = color;
    });

    Injection.colorPickerCubit.resumeColors[widget.itemCount-1].colorModel.color = _currentColor;
    Injection.colorPickerCubit.selectIndex(widget.itemCount-1);
  }
}
