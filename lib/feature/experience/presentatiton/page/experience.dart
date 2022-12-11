import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/custom_bottom_sheet.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/custom_divider.dart';
import '../../../../core/widget/floating_action_button.dart';
import '../../../../core/widget/initial_state_widget.dart';
import '../../../../core/widget/snackbar.dart';
import '../../data/model/experience_model.dart';
import '../cubit/cubit/experience_cubit.dart';
import '../cubit/text_controller/experience_text_controller_cubit.dart';
import '../widget/experience_item_widget.dart';
import '../../../../injection_container.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  late final ExperienceTextControllerCubit _textControllerCubit;
  late final ExperienceCubit _experienceCubit;

  @override
  void initState() {
    _textControllerCubit = getIt<ExperienceTextControllerCubit>.call();
    _experienceCubit = getIt<ExperienceCubit>.call();
    _experienceCubit.fetchData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      floatingActionButton: _addExperienceButton,
    );
  }

  Widget get _addExperienceButton => CustomFloationgButton(
        onTap: () {
          customBottomSheet(
            context: context,
            widget: Padding(
              padding: context.normalPadding,
              child: ListView(
                children: [
                  _companyNameTextField,
                  _jobRoleTextField,
                  _jobRoleTypeField,
                  _jobDateTextFields,
                  _saveExperienceButton,
                ],
              ),
            ),
          );
        },
      );

  Widget get _saveExperienceButton => SizedBox(
        width: context.width(1),
        child: ElevatedButton(
          child: const Text("Add Experience"),
          onPressed: () async {
            var experienceModel = ExperienceModel(
              companyName: _textControllerCubit.companyNameController.text,
              jobStartDate: _textControllerCubit.jobStartDateController.text,
              jobEndDate: _textControllerCubit.jobEndDateController.text,
              jobRole: _textControllerCubit.jobRoleController.text,
              skills: _textControllerCubit.jobSkillsController.text,
            );
            await _experienceCubit.save(experienceModel);
            _textControllerCubit.clearTextController();
          },
        ),
      );

  Widget get _jobDateTextFields => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: context.width(0.4),
            child: _jobStartDateTextField,
          ),
          SizedBox(
            width: context.width(0.4),
            child: _jobEndDateTextField,
          ),
        ],
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Experiences"),
        onTapUpdate: () {},
      );

  Widget get _buildBody => BlocConsumer<ExperienceCubit, ExperienceState>(
        listener: (context, state) {
          if (state is ExperienceDeleted) {
            getSnackBar(context, ExperienceDeleted.message);
          } else if (state is ExperienceSaved) {
            getSnackBar(context, ExperienceSaved.message);
          }
        },
        bloc: getIt<ExperienceCubit>.call(),
        builder: (context, state) {
          var experincesCubit = getIt<ExperienceCubit>.call();
          if (state is ExperienceInitial) {
            return const InitialStateWidget(
              text: "Add experiences into resume you have.",
            );
          } else if (state is ExperienceFetched) {
            return ListView.separated(
              padding: context.normalPadding,
              itemBuilder: (context, index) => ExperienceItemWidget(
                experienceModel: state.experienceData[index],
                onLongPress: () => showCustomDialog(
                  context,
                  index,
                  () => experincesCubit.delete(index),
                ),
              ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: state.experienceData.length,
            );
          } else {
            return const Text("elseee");
          }
        },
      );

  TextField get _companyNameTextField => TextField(
        decoration: const InputDecoration(hintText: "Company name"),
        controller: _textControllerCubit.companyNameController,
      );

  TextField get _jobRoleTextField => TextField(
        decoration: const InputDecoration(hintText: "Job role"),
        controller: _textControllerCubit.jobRoleController,
      );

  TextField get _jobRoleTypeField => TextField(
        decoration: const InputDecoration(hintText: "Job skills"),
        controller: _textControllerCubit.jobSkillsController,
      );

  TextField get _jobEndDateTextField => TextField(
        decoration: const InputDecoration(hintText: "Job end date"),
        controller: _textControllerCubit.jobEndDateController,
      );

  TextField get _jobStartDateTextField => TextField(
        decoration: const InputDecoration(hintText: "Job start date"),
        controller: _textControllerCubit.jobStartDateController,
      );
}
