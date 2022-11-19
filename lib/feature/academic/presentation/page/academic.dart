import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/export.dart';
import '../../../../injection_container.dart';
import '../../model/academic_data_model.dart';
import '../cubit/academic_cubit/academic_cubit.dart';
import '../widget/academic_item_widget.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  late final TextEditingController uniController;
  late final TextEditingController gradeController;
  late final TextEditingController scholarshipController;
  late final TextEditingController startDateController;
  late final TextEditingController majorController;
  late final TextEditingController endDateController;
  late final AcademicCubit academicCubit;
  AcademicDataModel? academicDataModel;

  @override
  void initState() {
    uniController = TextEditingController();
    gradeController = TextEditingController();
    scholarshipController = TextEditingController();
    majorController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    academicCubit = getIt<AcademicCubit>.call();

    academicCubit.getAcademicData().then(
      (value) {
        print(value);
        if (value is AcademicDataModel) {
          var val = value.fold(
            (l) => print(l),
            (r) => print(r),
          );
        }
      },
    );

    // uniController.text = academicDataModel.university ?? "";
    // gradeController.text = academicDataModel.grade ?? "";
    // scholarshipController.text = academicDataModel.grade ?? "";
    // majorController.text = academicDataModel.major ?? "";
    // startDateController.text = academicDataModel.schoolStartDate ?? "";
    // endDateController.text = academicDataModel.schoolStartDate ?? "";

    super.initState();
  }

  @override
  void dispose() {
    uniController.dispose();
    majorController.dispose();
    gradeController.dispose();
    scholarshipController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
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
                  uniTextField(),
                  majorTextField(),
                  gradeTextField(),
                  scolarShipTextField(),
                  _dateTextFields,
                  _saveAcademicDataButton
                ],
              ),
            );
          },
        ),
      );

  TextField majorTextField() => TextField(
        controller: majorController,
        decoration: const InputDecoration(hintText: "Major"),
      );

  Widget get _saveAcademicDataButton => ElevatedButton(
        onPressed: () async {
          var academicDataModel = AcademicDataModel(
            grade: gradeController.text,
            university: uniController.text,
            schoolEndDate: endDateController.text,
            schoolStartDate: startDateController.text,
            major: majorController.text,
            scholarship: scholarshipController.text,
          );

          await academicCubit.saveAcademicData(academicDataModel);
        },
        child: const Text("Save Academic Data"),
      );

  Widget gradeTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Grade"),
      controller: gradeController,
    );
  }

  Widget scolarShipTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Scolarship rate"),
      controller: scholarshipController,
    );
  }

  Widget uniTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "University"),
      controller: uniController,
    );
  }

  Widget get _dateTextFields => Row(
        children: [
          SizedBox(
            width: context.width(0.4),
            child: TextField(
              decoration: const InputDecoration(hintText: "Start date"),
              controller: startDateController,
              keyboardType: TextInputType.datetime,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: context.width(0.4),
            child: TextField(
              controller: endDateController,
              decoration: const InputDecoration(
                hintText: "End date",
              ),
              keyboardType: TextInputType.datetime,
            ),
          ),
        ],
      );

  Widget get _buidlBody => Padding(
        padding: context.normalPadding,
        child: BlocBuilder<AcademicCubit, AcademicState>(
          bloc: getIt<AcademicCubit>.call(),
          builder: (context, state) {
            var academicCubit = getIt<AcademicCubit>.call();
            if (state is AcademicInitial) {
              return const InitialStateWidget(
                text: "Add academic data into yout resume.",
              );
            } else {
              return ListView.separated(
                itemBuilder: (context, index) => AcademicItemWidget(
                  academicData: academicCubit.academicDataList[index],
                  index: index,
                  onLongPress: () => showCustomDialog(
                    context,
                    index,
                    () => academicCubit.removeAcademicData(index),
                  ),
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: academicCubit.academicDataList.length,
              );
            }
          },
        ),
      );

  CustomAppBar get _buildAppBar {
    return CustomAppBar(
      title: const Text("Academic"),
      onTapUpdate: () {},
    );
  }
}
