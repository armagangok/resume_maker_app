import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';
import 'package:resume_maker_app/core/util/pdf_maker/cloud_template.dart';
import 'package:resume_maker_app/core/util/pdf_maker/grey_plain_template.dart';
import 'package:resume_maker_app/core/util/pdf_maker/peach_puff_template.dart';

import '../../../../core/util/pdf_maker/contract/template_contract.dart';
import '../cubit/design_cubit.dart';

class ResumeTemplateBuilder extends StatelessWidget {
  const ResumeTemplateBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignCubit, DesignState>(
      bloc: Injection.designCubit,
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: resumeTemplateList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return _resumeItem(index);
          },
        );
      },
    );
  }

  Padding _resumeItem(int index) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: GestureDetector(
        onTap: () async {
          resumeTemplateList[index].createPdf().then((value) async {
            await resumeTemplateList[index].savePdfFile("${DateTime.now()}", value);
          });
        },
        child: Container(
          height: 300.h,
          color: Injection.designCubit.selectedColor,
          child: Center(
            child: Text(resumeTemplateList[index].templateName),
          ),
        ),
      ),
    );
  }
}

List<ResumeTemplateContract> resumeTemplateList = [
  CloudTemplate(),
  GreyPlainTemplate(),
  PeachPuffTemplate(),
];
