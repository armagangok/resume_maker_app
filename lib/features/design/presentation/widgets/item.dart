import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';
import '../cubit/design_cubit.dart';

class ResumeColorItem extends StatelessWidget {
  const ResumeColorItem({
    Key? key,
    required this.colorModel,
  }) : super(key: key);

  final ResumeColorModel colorModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignCubit, DesignState>(
      bloc: Injection.designCubit,
      builder: (context, state) {
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
