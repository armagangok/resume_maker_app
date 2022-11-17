import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/widget/export.dart';
import '../../../../injection_container.dart';
import '../cubit/cubit/experience_cubit.dart';

class ExperiencesPage extends StatelessWidget {
  const ExperiencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      floatingActionButton: _addExperienceButton,
    );
  }

  Widget get _addExperienceButton => CustomFloationgButton(
        onTap: () {},
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Experiences"),
        onTapUpdate: () {},
      );

  Widget get _buildBody => BlocBuilder<ExperienceCubit, ExperienceState>(
        bloc: getIt<ExperienceCubit>.call(),
        builder: (context, state) {
          if (state is ExperienceInitial) {
            return const InitialStateWidget(
              text: "Add experiences into resume you have.",
            );
          } else {
            return Column();
          }
        },
      );
}
