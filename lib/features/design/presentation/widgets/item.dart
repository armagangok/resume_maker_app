import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';

class ResumeColorItem extends StatelessWidget {
  const ResumeColorItem({
    Key? key,
    required this.colorModel,
  }) : super(key: key);

  final ResumeColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      bloc: Injection.colorPickerCubit,
      builder: (context, state) {
        return CircleAvatar(
          radius: 25.5.h,
          backgroundColor: colorModel.isSelected ? white : Colors.transparent,
          child: CircleAvatar(
            radius: 24.h,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 23.h,
              backgroundColor: colorModel.color,
              child: Center(
                child: Visibility(
                  visible: colorModel.isSelected,
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: white,
                    size: 30.h,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ResumeColorModel {
  bool isSelected;
  final Color color;

  ResumeColorModel({
    required this.color,
    this.isSelected = false,
  });
}
