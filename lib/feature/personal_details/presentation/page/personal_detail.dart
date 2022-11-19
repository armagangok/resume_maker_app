import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../injection_container.dart';
import '../../model/personal_data_model.dart';
import '../cubit/personal_text_controllers/personal_text_controllers_cubit.dart';
import '../cubit/pick_image/pick_image_cubit.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final PersonalTextControllerCubit personalTextControllers;
  @override
  void initState() {
    personalTextControllers = getIt<PersonalTextControllerCubit>.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  Widget get _buildBody => ListView(
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
        controller: personalTextControllers.locationController,
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
          onPressed: () {
            var personalDataModel = PersonalDataModel(
              name: personalTextControllers.nameController.text,
              location: personalTextControllers.locationController.text,
              phoneNumber: personalTextControllers.numberController.text,
              email: personalTextControllers.emailController.text,
              linkedin: personalTextControllers.linkedinController.text,
              birthday: personalTextControllers.birthdayController.text,
              imagePath: getIt<PickImageCubit>.call().image == null
                  ? ""
                  : getIt<PickImageCubit>.call().image!.path,
            );
          },
          child: const Text("Save"),
        ),
      );

  Widget get _nameTextField => TextField(
        controller: personalTextControllers.nameController,
        decoration: const InputDecoration(hintText: "Name"),
      );

  Widget get _birthDayTextField => TextField(
        controller: personalTextControllers.birthdayController,
        decoration: const InputDecoration(hintText: "Birthday"),
      );

  Widget get _linkedinTextField => TextField(
        controller: personalTextControllers.linkedinController,
        decoration: const InputDecoration(hintText: "Linkedin"),
      );

  Widget get _emailTextField => TextField(
        controller: personalTextControllers.emailController,
        decoration: const InputDecoration(hintText: "Email"),
      );

  Widget get _numberTextField => TextField(
        controller: personalTextControllers.numberController,
        decoration: const InputDecoration(hintText: "Phone Number"),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );
}
