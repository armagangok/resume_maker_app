import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/injection_container.dart';

import '../../../../global/widget/custom_appbar.dart';
import '../../../../global/widget/initial_state_widget.dart';
import '../cubit/cubit/experience_cubit.dart';

class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: BlocBuilder<ExperienceCubit, ExperienceState>(
        bloc: getIt<ExperienceCubit>.call(),
        builder: (context, state) {
          if (state is ExperienceInitial) {
            return const InitialStateWidget(
              text: "Add experiences that you have into resume.",
            );
          } else {}
          return Column();
        },
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: const Text("Experiences"),
      onTapUpdate: () {},
    );
  }
}
