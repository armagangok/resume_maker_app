import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/export.dart';
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
        onTapUpdate: () {},
        title: const Text("Skills"),
      );

  Widget get _buildBody => Padding(
        padding: context.normalPadding,
        child: BlocBuilder<SkillCubit, SkillState>(
          bloc: getIt<SkillCubit>.call(),
          builder: (context, state) {
            var skillCubit = getIt<SkillCubit>.call();

            if (state is SkillInitial) {
              return const InitialStateWidget(
                text: "Add the skills you have into your resume.",
              );
            } else {
              return ListView.separated(
                itemCount: getIt<SkillCubit>.call().skills.length,
                separatorBuilder: (context, index) => const CustomDivider(),
                itemBuilder: (context, index) => ListItemWidget(
                  text: skillCubit.skills[index],
                  index: index,
                  onTap: () => skillCubit.removeSkill(index),
                ),
              );
            }
          },
        ),
      );

  Future<dynamic> bottomSheet(BuildContext context) => customBottomSheet(
        context: context,
        widget: Padding(
          padding: context.normalPadding,
          child: ListView(
            children: [
              _skillTextField,
              _addLanguageButton,
            ],
          ),
        ),
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
