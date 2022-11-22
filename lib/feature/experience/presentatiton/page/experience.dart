import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/feature/experience/presentatiton/cubit/text_controller/experience_text_controller_cubit.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/export.dart';
import '../../../../injection_container.dart';
import '../../data/model/experience_model.dart';
import '../cubit/cubit/experience_cubit.dart';
import '../widget/experience_item_widget.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  late final ExperienceTextControllerCubit _textControllerCubit;
  @override
  void initState() {
    _textControllerCubit = getIt<ExperienceTextControllerCubit>.call();

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
                  _professionTextField,
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
          onPressed: () {
            var experienceModel = ExperienceModel(
              companyName: _textControllerCubit.companyNameController.text,
              profession: _textControllerCubit.professionController.text,
              jobStartDate: _textControllerCubit.jobStartDateController.text,
              jobEndDate: _textControllerCubit.jobEndDateController.text,
              jobRole: _textControllerCubit.jobRoleController.text,
              jobType: _textControllerCubit.jobTypeController.text,
            );
            getIt<ExperienceCubit>().save(experienceModel);
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

  Widget get _buildBody => BlocBuilder<ExperienceCubit, ExperienceState>(
        bloc: getIt<ExperienceCubit>.call(),
        builder: (context, state) {
          var experincesCubit = getIt<ExperienceCubit>.call();
          if (state is ExperienceInitial) {
            return const InitialStateWidget(
              text: "Add experiences into resume you have.",
            );
          } else {
            return ListView.separated(
              padding: context.normalPadding,
              itemBuilder: (context, index) => ExperienceItemWidget(
                experienceModel: experincesCubit.experiencesList[index],
                onLongPress: () => showCustomDialog(
                  context,
                  index,
                  () => experincesCubit.delete(index),
                ),
              ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: experincesCubit.experiencesList.length,
            );
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
        decoration: const InputDecoration(hintText: "Job role type"),
        controller: _textControllerCubit.jobTypeController,
      );

  TextField get _professionTextField => TextField(
        decoration: const InputDecoration(hintText: "Profession"),
        controller: _textControllerCubit.professionController,
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
