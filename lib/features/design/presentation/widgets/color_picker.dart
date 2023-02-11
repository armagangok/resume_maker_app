import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/injection/injection_service.dart';
import '../../../../core/theme/constants/colors.dart';
import '../cubit/design_cubit.dart';
import '../pages/design_page.dart';

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({
    super.key,
  });

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  void initState() {
    _designCubit = Injection.designCubit;
    super.initState();
  }

  late final DesignCubit _designCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Center(
        child: BlocBuilder<DesignCubit, DesignState>(
          bloc: _designCubit,
          builder: (context, state) {
            return ListView.separated(
                addAutomaticKeepAlives: false,
                addRepaintBoundaries: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _designCubit.resumeColors.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () => Injection.designCubit.selectIndex(index),
                      child: ColorItem(
                        colorModel: _designCubit.resumeColors[index],
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10));
          },
        ),
      ),
    );
  }
}


class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.colorModel,
  }) : super(key: key);

  final ResumeColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 17.h,
      backgroundColor: colorModel.isSelected ? white : Colors.transparent,
      child: CircleAvatar(
        radius: 15.h,
        backgroundColor: colorModel.color,
        child: Center(
          child: Visibility(
            visible: colorModel.isSelected,
            child: Icon(
              CupertinoIcons.check_mark,
              color: white,
              size: 17.h,
            ),
          ),
        ),
      ),
    );
  }
}
