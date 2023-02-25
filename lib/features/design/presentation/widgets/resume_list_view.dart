import 'package:flutter/cupertino.dart';

import '../../../../core/export/export.dart';

class ResumeTemplateBuilder extends StatelessWidget {
  const ResumeTemplateBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      bloc: Injection.colorPickerCubit,
      builder: (context, state) {
        return BlocBuilder<PreviewCubit, PreviewState>(
          bloc: Injection.previewCubit,
          builder: (context, state) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: Injection.previewCubit.resumeTemplateList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return _resumeItem(index);
              },
            );
          },
        );
      },
    );
  }

  Padding _resumeItem(int index) {
    return Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Injection.previewCubit.selectTemplate(index);
            },
            child: Container(
              height: 300.h,
              color: Injection.colorPickerCubit.selectedColor,
              child: Center(
                child: Text(
                  Injection.previewCubit.resumeTemplateList[index].templateName,
                ),
              ),
            ),
          ),
          Visibility(
            visible:
                Injection.previewCubit.resumeTemplateList[index].isSelected,
            child: Positioned(
              bottom: 5.w,
              right: 5.w,
              child: CircleAvatar(
                radius: 19,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: selectedItemColor,
                  radius: 18.h,
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    size: 25.h,
                    color: white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
