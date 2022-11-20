import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_maker_app/core/widget/custom_bottom_sheet.dart';
import 'package:resume_maker_app/core/widget/floating_action_button.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../injection_container.dart';
import '../../model/personal_data_model.dart';
import '../cubit/personal_data/personal_data_cubit.dart';
import '../cubit/personal_text_controllers/personal_text_controllers_cubit.dart';
import '../cubit/pick_image/pick_image_cubit.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final PersonalTextControllerCubit _personalTextControllers;
  late final PersonalDataCubit _personalDataCubit;
  @override
  void initState() {
    _personalTextControllers = getIt<PersonalTextControllerCubit>.call();
    _personalDataCubit = getIt<PersonalDataCubit>.call();
    _personalDataCubit.getPersonalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      floatingActionButton: _addPersonalDataButton,
    );
  }

  Widget get _addPersonalDataButton => CustomFloationgButton(
        onTap: () {
          customBottomSheet(
            context: context,
            widget: ListView(
              padding: context.normalPadding,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height(0.025)),
                    _uploadImageButton,
                    SizedBox(height: context.height(0.025)),
                    _informationTextStack,
                    SizedBox(height: context.height(0.025)),
                    _updateButton,
                  ],
                ),
              ],
            ),
          );
        },
      );

  Widget get _buildBody => BlocBuilder<PersonalDataCubit, PersonalDataState>(
        bloc: _personalDataCubit,
        builder: (context, state) {
          if (state is PersonalDataInitial) {
            return const Center(
              child: Text("Add personal data."),
            );
          } else if (state is DataReceived) {
            return Text(state.personalData.email);
          } else {
            return const Text("else");
          }
        },
      );

  Widget get _uploadImageButton => InkWell(
        onTap: () async {
          var imagePickerCubit = getIt<PickImageCubit>.call();
          await imagePickerCubit.pickImage();
        },
        child: BlocBuilder<PickImageCubit, PickImageState>(
          bloc: getIt<PickImageCubit>.call(),
          builder: (context, state) {
            var imagePickerCubit = getIt<PickImageCubit>.call();
            if (state is PickImageInitial) {
              return _loadingImageWidget(
                const Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.grey,
                  size: 100,
                ),
              );
            } else if (state is ImageLoading) {
              return _loadingImageWidget(const CircularProgressIndicator());
            } else if (state is ImageLoaded) {
              File imageFile = File(imagePickerCubit.image!.path);
              return _userImageWidget(imageFile);
            } else {
              return const Center(child: Text("Error while uploading image."));
            }
          },
        ),
      );

  Widget _loadingImageWidget(Widget widget) {
    return CircleAvatar(
      radius: context.height(0.125),
      backgroundColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget,
            Text(
              "Tap to upload image.",
              style: context.textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userImageWidget(File file) {
    return CircleAvatar(
      radius: context.height(0.125),
      backgroundImage: AssetImage(file.path),
      backgroundColor: Colors.white,
    );
  }

  Widget get _informationTextStack => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalInformationText,
          _nameTextField,
          _locationTextField,
          _numberTextField,
          _emailTextField,
          _linkedinTextField,
          _birthDayTextField,
        ],
      );

  Widget get _locationTextField => TextField(
        controller: _personalTextControllers.locationController,
        decoration: const InputDecoration(hintText: "Location"),
      );

  Widget get _personalInformationText => Builder(
        builder: (context) => Text(
          "Personal Infomarmation",
          style: context.textTheme.headline5,
        ),
      );

  Widget get _updateButton => SizedBox(
        width: context.width(1),
        child: ElevatedButton(
          onPressed: () async {
            var personalDataModel = PersonalDataModel(
              name: _personalTextControllers.nameController.text,
              location: _personalTextControllers.locationController.text,
              phoneNumber: _personalTextControllers.numberController.text,
              email: _personalTextControllers.emailController.text,
              linkedin: _personalTextControllers.linkedinController.text,
              birthday: _personalTextControllers.birthdayController.text,
              imagePath: getIt<PickImageCubit>.call().image == null
                  ? ""
                  : getIt<PickImageCubit>.call().image!.path,
            );

            await _personalDataCubit.savePersonalData(personalDataModel);
          },
          child: const Text("Save"),
        ),
      );

  Widget get _nameTextField => TextField(
        controller: _personalTextControllers.nameController,
        decoration: const InputDecoration(hintText: "Name"),
      );

  Widget get _birthDayTextField => TextField(
        controller: _personalTextControllers.birthdayController,
        decoration: const InputDecoration(hintText: "Birthday"),
      );

  Widget get _linkedinTextField => TextField(
        controller: _personalTextControllers.linkedinController,
        decoration: const InputDecoration(hintText: "Linkedin"),
      );

  Widget get _emailTextField => TextField(
        controller: _personalTextControllers.emailController,
        decoration: const InputDecoration(hintText: "Email"),
      );

  Widget get _numberTextField => TextField(
        controller: _personalTextControllers.numberController,
        decoration: const InputDecoration(hintText: "Phone Number"),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );
}
