import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';
import 'package:resume_maker_app/core/util/pdf_maker/cloud_template.dart';

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
          itemCount: 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0.h),
              child: GestureDetector(
                onTap: () async {
                  var cloud = CloudTemplate();
                  var file = await cloud.createPdf();
                  await cloud.savePdfFile("${DateTime.now()}", file);
                },
                child: Container(
                  height: 300.h,
                  color: Injection.designCubit.selectedColor,
                  child: const Center(
                    child: Text("Cloud Template"),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
