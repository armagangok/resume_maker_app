import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../widget/reference_item.dart';

class ReferencePage extends StatefulWidget {
  const ReferencePage({Key? key}) : super(key: key);

  @override
  ReferenceScreenState createState() => ReferenceScreenState();
}

class ReferenceScreenState extends State<ReferencePage> {
  late final ReferenceCubit _referenceCubit;

  @override
  void initState() {
    _referenceCubit = getIt<ReferenceCubit>.call();

    _referenceCubit.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      floatingActionButton: _addReferenceButton,
      body: Padding(
        padding: context.normalPadding,
        child: _buildBody,
      ),
    );
  }

  Widget get _buildBody => BlocConsumer<ReferenceCubit, ReferenceState>(
        listener: (context, state) {
          if (state is ReferenceDeleted) {
            getSnackBar(context, "Reference deleted succesfully.");
          }
        },
        bloc: _referenceCubit,
        builder: (context, state) {
          if (state is ReferenceInitial) {
            return _initialText;
          } else if (state is ReferenceFetched) {
            var referencesList = state.referenceData;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ReferenceItemWidget(
                  thReference: "${index + 1}",
                  name: referencesList[index].name ?? "",
                  profession: referencesList[index].profession ?? "",
                  recentCompany: referencesList[index].recentCompany ?? "",
                  email: referencesList[index].email ?? "",
                  phoneNumber: referencesList[index].phoneNumber ?? "",
                  onLongTap: () => showCustomDialog(
                    context,
                    index,
                    () => _referenceCubit.delete(index),
                  ),
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: referencesList.length,
            );
          } else {
            return const Text("data");
          }
        },
      );

  Widget get _initialText {
    return const Center(
      child: Text("Add references into your resume."),
    );
  }

  TextField get _phoneNumberTextField => TextField(
        decoration: const InputDecoration(hintText: "Phone Number"),
        controller: _referenceCubit.phoneNumberController,
      );

  TextField get _emailTextField => TextField(
        decoration: const InputDecoration(hintText: "Reference Email"),
        controller: _referenceCubit.emailController,
      );

  TextField get _professionTextField => TextField(
        decoration: const InputDecoration(hintText: "Profession"),
        controller: _referenceCubit.professionController,
      );

  TextField get _nameTextTextField => TextField(
        decoration: const InputDecoration(hintText: "Name Surname"),
        controller: _referenceCubit.nameController,
      );

  TextField get _recentCompanyTextField => TextField(
        decoration: const InputDecoration(hintText: "Recent Company"),
        controller: _referenceCubit.recentCompanyController,
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Reference"),
        onTapUpdate: () {},
      );

  Widget get _addReferenceButton => Builder(
        builder: (context) => CustomFloationgButton(
          onTap: () => customBottomSheet(
            context: context,
            widget: Padding(
              padding: context.normalPadding,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _nameTextTextField,
                    _professionTextField,
                    _recentCompanyTextField,
                    _emailTextField,
                    _phoneNumberTextField,
                    _saveReferenceButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _saveReferenceButton {
    return SizedBox(
      width: context.width(1),
      child: ElevatedButton(
        onPressed: () async {
          var reference = ReferenceModel(
            name: _referenceCubit.nameController.text,
            profession: _referenceCubit.professionController.text,
            email: _referenceCubit.emailController.text,
            phoneNumber: _referenceCubit.phoneNumberController.text,
            recentCompany: _referenceCubit.recentCompanyController.text,
          );
          await _referenceCubit.save(reference);

          _referenceCubit.clearTextController;
        },
        child: const Text("Add As Reference"),
      ),
    );
  }
}
