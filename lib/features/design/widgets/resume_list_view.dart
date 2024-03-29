import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

import '../../../../core/export/export.dart';
import '../../../../core/widget/stroke_text.dart';

class ResumeTemplateBuilder extends StatelessWidget {
  const ResumeTemplateBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorPickerCubit, ColorPickerState>(
      bloc: Injection.colorPickerCubit,
      builder: (context, state) {
        return BlocBuilder<ResumeTemplateCubit, ResumeTemplateState>(
          bloc: Injection.resumeTemplateCubit,
          builder: (context, state) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount:
                  Injection.resumeTemplateCubit.resumeTemplateList.length,
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

  Widget _resumeItem(int index) => Builder(
    builder: (context) {
      return Padding(
            padding: EdgeInsets.all(5.0.w),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Injection.resumeTemplateCubit.selectTemplate(index);
                  },
                  child: Container(
                    height: 300.h,
                    color: Injection.colorPickerCubit.selectedColor,
                    child: Center(
                      child: StrokeText(
                        text: Injection.resumeTemplateCubit.resumeTemplateList[index]
                            .templateName,
                            style: context.bodyLarge,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: Injection
                      .resumeTemplateCubit.resumeTemplateList[index].isSelected,
                  child: Positioned(
                    bottom: 5.w,
                    right: 5.w,
                    child: CircleAvatar(
                      radius: 19.h,
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
                ),
              ],
            ),
          );
    }
  );
}
