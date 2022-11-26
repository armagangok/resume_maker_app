import 'package:flutter/material.dart';

import '../../academic_export.dart';

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
      child: BlocConsumer<AcademicCubit, AcademicState>(
        listener: (context, state) {
          if (state is AcademicDeleted) {
            getSnackBar(context, AcademicDeleted.message);
          } else if (state is AcademicSaved) {
            getSnackBar(context, AcademicSaved.message);
          }
        },
        bloc: academicCubit,
        builder: (context, state) {
          if (state is AcademicInitial) {
            return const InitialStateWidget(
              text: "Add academic data into yout resume.",
            );
          } else if (state is AcademicDataReceived) {
            return ListView.separated(
              itemBuilder: (context, index) => AcademicItemWidget(
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
          } else if (state is AcademicFetchingError) {
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
      title: const Text("Academic"),
      onTapUpdate: () {},
    );
  }
}
