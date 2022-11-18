import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/custom_appbar.dart';
import '../../../../injection_container.dart';
import '../../model/personal_data_model.dart';
import '../cubit/pick_image/pick_image_cubit.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final TextEditingController nameController;

  late final TextEditingController numberController;
  late final TextEditingController emailController;
  late final TextEditingController linkedinController;
  late final TextEditingController birthdayController;
  late final TextEditingController locationController;

  @override
  void initState() {
    nameController = TextEditingController();
    numberController = TextEditingController();
    locationController = TextEditingController();
    emailController = TextEditingController();
    linkedinController = TextEditingController();
    birthdayController = TextEditingController();
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
              _informationTextStack,
              SizedBox(height: context.height(0.05)),
              _uploadImageButton,
              SizedBox(height: context.height(0.05)),
              _updateButton,
            ],
          ),
        ],
      );

  InkWell get _uploadImageButton => InkWell(
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

  CircleAvatar _loadingImageWidget(Widget widget) {
    return CircleAvatar(
      radius: context.height(0.125),
      backgroundColor: Colors.white,
      child: Center(
        child: widget,
      ),
    );
  }

  CircleAvatar _userImageWidget(File file) {
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

  TextField get _locationTextField => TextField(
        controller: locationController,
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
              name: nameController.text,
              location: locationController.text,
              phoneNumber: numberController.text,
              email: emailController.text,
              linkedin: linkedinController.text,
              birthday: birthdayController.text,
              imagePath: getIt<PickImageCubit>.call().image == null
                  ? ""
                  : getIt<PickImageCubit>.call().image!.path,
            );
          },
          child: const Text("Save"),
        ),
      );

  TextField get _nameTextField => TextField(
        controller: nameController,
        decoration: const InputDecoration(hintText: "Name"),
      );

  TextField get _birthDayTextField => TextField(
        controller: birthdayController,
        decoration: const InputDecoration(hintText: "Birthday"),
      );

  TextField get _linkedinTextField => TextField(
        controller: linkedinController,
        decoration: const InputDecoration(hintText: "Linkedin"),
      );

  TextField get _emailTextField => TextField(
        controller: emailController,
        decoration: const InputDecoration(hintText: "Email"),
      );

  TextField get _numberTextField => TextField(
        controller: numberController,
        decoration: const InputDecoration(hintText: "Phone Number"),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );
}
