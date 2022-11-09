import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/widget/global_widget_export.dart';
import '../../../../injection_container.dart';
import '../cubit/skill_cubit.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late final TextEditingController skillController;

  @override
  void initState() {
    skillController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      floatingActionButton: _addSkillButton,
    );
  }

  Widget get _addSkillButton {
    return CustomFloationgButton(onTap: () {});
  }

  AppBar get _buildAppBar => AppBar();

  Widget get _buildBody => BlocBuilder<SkillCubit, SkillState>(
        bloc: getIt<SkillCubit>.call(),
        builder: (context, state) {
          var skillCubit = getIt<SkillCubit>.call();
          return ListView.separated(
            itemCount: getIt<SkillCubit>.call().skills.length,
            separatorBuilder: (context, index) => const SizedBox(),
            itemBuilder: (context, index) => ListItemWidget(
              text: skillCubit.skills[index],
              index: index,
              onTap: () => skillCubit.removeSkill(index),
            ),
          );
        },
      );
}
