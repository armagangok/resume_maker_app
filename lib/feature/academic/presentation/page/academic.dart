import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/export.dart';
import '../../../../injection_container.dart';
import '../../model/academic_data_model.dart';
import '../cubit/academic_data/academic_cubit.dart';
import '../cubit/text_controller/text_controller_cubit.dart';
import '../widget/academic_item_widget.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  late final AcademicTextControllerCubit academicTextControllerCubit;
  late final AcademicCubit academicCubit;

  @override
  void initState() {
    academicCubit = getIt<AcademicCubit>.call();
    academicTextControllerCubit = getIt<AcademicTextControllerCubit>.call();
    academicCubit.getAcademicData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buidlBody,
      floatingActionButton: _addAcademicDataButton,
    );
  }

  Widget get _addAcademicDataButton => Builder(
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
                  _scolarShipTextField,
                  _dateTextFields,
                  _saveAcademicDataButton
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

  Widget get _saveAcademicDataButton => ElevatedButton(
        onPressed: () async {
          var academicDataModel = AcademicDataModel(
            grade: academicTextControllerCubit.gradeController.text,
            university: academicTextControllerCubit.uniController.text,
            schoolEndDate: academicTextControllerCubit.endDateController.text,
            schoolStartDate:
                academicTextControllerCubit.startDateController.text,
            major: academicTextControllerCubit.majorController.text,
            scholarship: academicTextControllerCubit.scholarshipController.text,
          );

          await academicCubit.saveAcademicData(academicDataModel);
        },
        child: const Text("Save Academic Data"),
      );

  Widget get _gradeTextField => TextField(
        decoration: const InputDecoration(
          hintText: "Grade",
        ),
        controller: academicTextControllerCubit.gradeController,
      );

  Widget get _scolarShipTextField => TextField(
        decoration: const InputDecoration(
          hintText: "Scolarship rate",
        ),
        controller: academicTextControllerCubit.scholarshipController,
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
    var academicCubit = getIt<AcademicCubit>.call();
    return Padding(
      padding: context.normalPadding,
      child: BlocBuilder<AcademicCubit, AcademicState>(
        bloc: academicCubit,
        builder: (context, state) {
          if (state is AcademicInitial) {
            return const InitialStateWidget(
              text: "Add academic data into yout resume.",
            );
          } else if (state is DataLoaded) {
            return ListView.separated(
              itemBuilder: (context, index) => AcademicItemWidget(
                academicData: state.academicDataModel[index],
                index: index,
                onLongPress: () => showCustomDialog(
                  context,
                  index,
                  () => academicCubit.deleteData(index),
                ),
              ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: state.academicDataModel.length,
            );
          } else if (state is DataDeleted) {
            return ListView.separated(
              itemBuilder: (context, index) => AcademicItemWidget(
                academicData: state.academicDataModel[index],
                index: index,
                onLongPress: () => showCustomDialog(
                  context,
                  index,
                  () async => await academicCubit.deleteData(index),
                ),
              ),
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: state.academicDataModel.length,
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
      title: const Text("Academic"),
      onTapUpdate: () {},
    );
  }
}


// "University: ${data.university}";
// "Grade: ${data.grade}";
// "Scholarship: ${data.scholarship}";
// "Major: ${data.major}";
// "School end date: ${data.schoolEndDate}";
// "School start date: ${data.schoolStartDate}";