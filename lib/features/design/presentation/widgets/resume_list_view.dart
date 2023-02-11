import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          itemCount: Injection.designCubit.resumeColors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              color: Injection.designCubit.resumeColors[index].color,
            );
          },
        );
      },
    );
  }
}
