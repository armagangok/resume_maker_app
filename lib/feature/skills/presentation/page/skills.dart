import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/custom_bottom_sheet.dart';
import '../../../../core/widget/custom_divider.dart';
import '../../../../core/widget/floating_action_button.dart';
import '../../../../core/widget/initial_state_widget.dart';
import '../../../../core/widget/list_item_widget.dart';
import '../../../../core/widget/snackbar.dart';
import '../../data/model/skill_model.dart';
import '../cubit/skill_cubit/skill_cubit.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late final TextEditingController skillController;
  late final SkillCubit _skillCubit;

  @override
  void initState() {
    skillController = TextEditingController();
    _skillCubit = _skillCubit;
    _skillCubit.fetchSkillData();
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
        child: BlocConsumer<SkillCubit, SkillState>(
          listener: (context, state) {
            if (state is SkillDeleted) {
              getSnackBar(context, SkillDeleted.message);
            } else if (state is SkillDeletingError) {
              getSnackBar(context, SkillDeletingError.message);
            } else if (state is SkillSavingError) {
              getSnackBar(context, SkillSavingError.message);
            } else if (state is SkillSaved) {
              getSnackBar(context, SkillSaved.message);
            }
          },
          bloc: _skillCubit,
          builder: (context, state) {
            if (state is SkillInitial) {
              return const InitialStateWidget(
                text: "Add the skills you have into your resume.",
              );
            } else if (state is SkillFetched) {
              return ListView.separated(
                itemCount: state.skillData.length,
                separatorBuilder: (context, index) => const CustomDivider(),
                itemBuilder: (context, index) => ListItemWidget(
                  text: state.skillData[index].skill,
                  index: index,
                  onTap: () async => await _skillCubit.delete(index),
                ),
              );
            }
            return const InitialStateWidget(
              text: "Add the skills you have into your resume.",
            );
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
            text.isNotEmpty
                ? _skillCubit.save(SkillModel(skill: text))
                : getSnackBar(context, "Skill cannot be empty");
            skillController.clear();
          },
          child: const Text("Add Skill"),
        ),
      );
}
