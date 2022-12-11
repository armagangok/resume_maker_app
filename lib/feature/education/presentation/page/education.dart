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
import '../../education_export.dart';
import '../../../../injection_container.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  late final EducationTextControllerCubit academicTextControllerCubit;
  late final EducationCubit academicCubit;

  @override
  void initState() {
    academicCubit = getIt<EducationCubit>.call();
    academicTextControllerCubit = getIt<EducationTextControllerCubit>.call();
    academicCubit.getEducationData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buidlBody,
      floatingActionButton: _addEducationDataButton,
    );
  }

  Widget get _addEducationDataButton => Builder(
        builder: (context) => CustomFloationgButton(
          onTap: () {
            customBottomSheet(
              context: context,
              widget: ListView(
                padding: context.normalPadding,
                children: [
                  _uniTextField,
                  _majorTextField,
                  _gradeTextField,
                  _dateTextFields,
                  _saveEducationDataButton
                ],
              ),
            );
          },
        ),
      );

  Widget get _majorTextField => TextField(
        controller: academicTextControllerCubit.majorController,
        decoration: const InputDecoration(
          hintText: "Major",
        ),
      );

  Widget get _saveEducationDataButton => ElevatedButton(
        onPressed: () async {
          var academicDataModel = EducationDataModel(
            grade: academicTextControllerCubit.gradeController.text,
            university: academicTextControllerCubit.uniController.text,
            schoolEndDate: academicTextControllerCubit.endDateController.text,
            schoolStartDate:
                academicTextControllerCubit.startDateController.text,
            major: academicTextControllerCubit.majorController.text,
          );

          await academicCubit.saveEducationData(academicDataModel);
        },
        child: const Text("Save Education Data"),
      );

  Widget get _gradeTextField => TextField(
        decoration: const InputDecoration(
          hintText: "Grade",
        ),
        controller: academicTextControllerCubit.gradeController,
      );

  Widget get _uniTextField => TextField(
        decoration: const InputDecoration(
          hintText: "University",
        ),
        controller: academicTextControllerCubit.uniController,
      );

  Widget get _dateTextFields => Row(
        children: [
          SizedBox(
            width: context.width(0.4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Start date",
              ),
              controller: academicTextControllerCubit.startDateController,
              keyboardType: TextInputType.datetime,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: context.width(0.4),
            child: TextField(
              controller: academicTextControllerCubit.endDateController,
              decoration: const InputDecoration(
                hintText: "End date",
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),
        ],
      );

  Widget get _buidlBody {
    return Padding(
      padding: context.normalPadding,
      child: BlocConsumer<EducationCubit, EducationState>(
        listener: (context, state) {
          if (state is EducationDeleted) {
            getSnackBar(context, EducationDeleted.message);
          } else if (state is EducationSaved) {
            getSnackBar(context, EducationSaved.message);
          }
        },
        bloc: academicCubit,
        builder: (context, state) {
          if (state is EducationInitial) {
            return const InitialStateWidget(
              text: "Add academic data into yout resume.",
            );
          } else if (state is EducationDataReceived) {
            return ListView.separated(
              itemBuilder: (context, index) => EducationItemWidget(
                academicData: state.academicDataList[index],
                index: index,
                onLongPress: () => showCustomDialog(
                  context,
                  index,
                  () => academicCubit.deleteData(index),
                ),
              ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: state.academicDataList.length,
            );
          } else if (state is EducationFetchingError) {
            return const Center(
              child: Text(
                "Unexpected caching error while catching data from database.",
              ),
            );
          } else {
            return const Text("Data");
          }
        },
      ),
    );
  }

  CustomAppBar get _buildAppBar {
    return CustomAppBar(
      title: const Text("Education"),
      onTapUpdate: () {},
    );
  }
}
