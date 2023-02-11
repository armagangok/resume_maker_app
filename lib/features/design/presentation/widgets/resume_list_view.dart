import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';

import '../cubit/design_cubit.dart';

class ResumeListViewBuilder extends StatelessWidget {
  const ResumeListViewBuilder({
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
          itemCount: Injection.designCubit.resumeColors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Container(
                height: 300.h,
                color: Injection.designCubit.selectedColor,
                child: const Text("Resume Template"),
              ),
            );
          },
        );
      },
    );
  }
}
