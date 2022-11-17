import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/custom_divider.dart';
import '../../../../global/widget/export.dart';
import '../../../../injection_container.dart';
import '../../model/reference_model.dart';
import '../cubit/references/references_cubit.dart';
import '../widget/reference_item.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({Key? key}) : super(key: key);

  @override
  ReferencesScreenState createState() => ReferencesScreenState();
}

class ReferencesScreenState extends State<ReferencesPage> {
  late final TextEditingController nameController;
  late final TextEditingController professionController;
  late final TextEditingController recentCompanyController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;

  @override
  void initState() {
    nameController = TextEditingController();
    professionController = TextEditingController();
    recentCompanyController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
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

  Widget get _buildBody => BlocBuilder<ReferencesCubit, ReferencesState>(
        bloc: getIt<ReferencesCubit>.call(),
        builder: (context, state) {
          if (state is ReferenceInitial) {
            return _initialText;
          } else {
            var referencesList = getIt<ReferencesCubit>.call().referencesList;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ReferenceItemWidget(
                  thReference: "${index + 1}",
                  name: referencesList[index].name ?? "",
                  profession: referencesList[index].profession ?? "",
                  recentCompany: referencesList[index].recentCompany ?? "",
                  email: referencesList[index].email ?? "",
                  phoneNumber: referencesList[index].phoneNumber ?? "",
                );
              },
              separatorBuilder: (context, index) => const CustomDivider(),
              itemCount: referencesList.length,
            );
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
        controller: phoneNumberController,
      );

  TextField get _emailTextField => TextField(
        decoration: const InputDecoration(hintText: "Reference Email"),
        controller: emailController,
      );

  TextField get _professionTextField => TextField(
        decoration: const InputDecoration(hintText: "Profession"),
        controller: professionController,
      );

  TextField get _nameTextTextField => TextField(
        decoration: const InputDecoration(hintText: "Name Surname"),
        controller: nameController,
      );

  TextField get _recentCompanyTextField => TextField(
        decoration: const InputDecoration(hintText: "Recent Company"),
        controller: recentCompanyController,
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("References"),
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
        onPressed: () {
          var reference = ReferenceModel(
            name: nameController.text,
            profession: professionController.text,
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            recentCompany: recentCompanyController.text,
          );
          getIt<ReferencesCubit>.call().addReference(reference);
        },
        child: const Text("Add As Reference"),
      ),
    );
  }
}
