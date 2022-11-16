import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/custom_appbar.dart';
import '../../../../global/widget/global_widget_export.dart';
import '../../../../global/widget/snackbar.dart';
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

  Widget get _addSkillButton => CustomFloationgButton(
        onTap: () => bottomSheet(context),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        onTapText: () {},
        title: const Text("Skills"),
      );

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

  Future<dynamic> bottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: context.normalPadding,
            child: ListView(
              children: [
                _skillTextField,
                _addLanguageButton,
              ],
            ),
          );
        },
      );

  Widget get _skillTextField => TextField(
        controller: skillController,
        decoration: const InputDecoration(
          hintText: "Add your skills",
        ),
      );

  Widget get _addLanguageButton => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            var text = skillController.text;
            (text.isNotEmpty)
                ? getIt<SkillCubit>().addSkill(text)
                : getSnackBar(context, "Skill cannot be empty");
            skillController.clear();
          },
          child: const Text("Add Skill"),
        ),
      );
}
