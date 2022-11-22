import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final PickImageCubit _imagePickerCubit;

  @override
  void initState() {
    _personalTextControllers = getIt<PersonalTextControllerCubit>.call();
    _personalDataCubit = getIt<PersonalDataCubit>.call();
    _personalDataCubit.getPersonalData();
    _imagePickerCubit = getIt<PickImageCubit>.call();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocBuilder<PersonalDataCubit, PersonalDataState>(
        bloc: _personalDataCubit,
        builder: (context, state) {
          if (state is PersonalDataInitial) {
            return ListView(
              padding: context.normalPadding,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height(0.025)),
                    _uploadImageButton(state),
                    SizedBox(height: context.height(0.025)),
                    _informationTextStack(state),
                    SizedBox(height: context.height(0.025)),
                    _updateButton(state),
                  ],
                ),
              ],
            );
          } else if (state is DataReceived) {
            return ListView(
              padding: context.normalPadding,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height(0.025)),
                    _uploadImageButton(state),
                    SizedBox(height: context.height(0.025)),
                    _informationTextStack(state),
                    SizedBox(height: context.height(0.025)),
                    _updateButton(state),
                  ],
                ),
              ],
            );
          } else {
            return const Text("else");
          }
        },
      );

  Widget _uploadImageButton(DataReceivedContract personalDataState) => InkWell(
        onTap: () async {
          await _imagePickerCubit.pickImage();
        },
        child: BlocBuilder<PickImageCubit, PickImageState>(
          bloc: getIt<PickImageCubit>.call(),
          builder: (context, imageState) {
            if (imageState is PickImageInitial) {
              File imageFile = File(personalDataState.personalData.imagePath!);

              return personalDataState.personalData.imagePath == null ||
                      personalDataState.personalData.imagePath!.isEmpty
                  ? CircleAvatar(
                      radius: context.height(0.125),
                      backgroundColor: Colors.white,
                      backgroundImage: const AssetImage('assets/person.png'),
                    )
                  : _userImageWidget(imageFile);
            } else if (imageState is ImageLoading) {
              return _loadingImageWidget(const CircularProgressIndicator());
            } else if (imageState is ImageLoaded) {
              File imageFile = File(imageState.imagePath!);

              return _userImageWidget(imageFile);
            } else {
              return CircleAvatar(
                radius: context.height(0.125),
                backgroundColor: Colors.white,
                child: const Center(
                  child: Text("Error while uploading image."),
                ),
              );
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
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              ),
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

  Widget _informationTextStack(DataReceivedContract state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalInformationText,
          _nameTextField(state.personalData),
          _locationTextField(state),
          _numberTextField(state.personalData),
          _emailTextField(state.personalData),
          _linkedinTextField(state.personalData),
          _birthDayTextField(state.personalData),
        ],
      );

  Widget _locationTextField(DataReceivedContract state) => TextField(
        controller: _personalTextControllers.locationController,
        decoration: InputDecoration(
          hintText: state.personalData.location == null ||
                  state.personalData.location!.isEmpty
              ? "Location"
              : state.personalData.location,
        ),
      );

  Widget get _personalInformationText => Builder(
        builder: (context) => Text(
          "Personal Infomarmation",
          style: context.textTheme.headline5!.copyWith(),
        ),
      );

  Widget _updateButton(DataReceivedContract state) => SizedBox(
        width: context.width(1),
        child: ElevatedButton(
          onPressed: () async {
            final personalDataModel = _preparePersonalDataModel(state);
            await _personalDataCubit.savePersonalData(personalDataModel);
          },
          child: const Text("Update"),
        ),
      );

  Widget _nameTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalTextControllers.nameController,
        decoration: InputDecoration(
          hintText: (personalDataModel.name == null ||
                  personalDataModel.name!.isEmpty)
              ? "Name"
              : personalDataModel.name,
        ),
      );

  Widget _birthDayTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalTextControllers.birthdayController,
        decoration: InputDecoration(
          hintText: (personalDataModel.birthday == null ||
                  personalDataModel.birthday!.isEmpty)
              ? "Birthday"
              : personalDataModel.birthday,
        ),
      );

  Widget _linkedinTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalTextControllers.linkedinController,
        decoration: InputDecoration(
          hintText: personalDataModel.linkedin == null ||
                  personalDataModel.linkedin == ""
              ? "Linkedin"
              : personalDataModel.linkedin,
        ),
      );

  Widget _emailTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalTextControllers.emailController,
        decoration: InputDecoration(
          hintText: (personalDataModel.email == null ||
                  personalDataModel.email!.isEmpty)
              ? "Email"
              : personalDataModel.email,
        ),
      );

  Widget _numberTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalTextControllers.numberController,
        decoration: InputDecoration(
          hintText: personalDataModel.phoneNumber == null ||
                  personalDataModel.phoneNumber == ""
              ? "Phone Number"
              : personalDataModel.phoneNumber,
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );

  PersonalDataModel _preparePersonalDataModel(DataReceivedContract state) {
    var personalDataModel = PersonalDataModel(
      name: _personalTextControllers.nameController.text.isEmpty
          ? state.personalData.name
          : _personalTextControllers.nameController.text,
      location: _personalTextControllers.locationController.text.isEmpty
          ? state.personalData.location
          : _personalTextControllers.locationController.text,
      phoneNumber: _personalTextControllers.numberController.text.isEmpty
          ? state.personalData.phoneNumber
          : _personalTextControllers.numberController.text,
      email: _personalTextControllers.emailController.text.isEmpty
          ? state.personalData.email
          : _personalTextControllers.emailController.text,
      linkedin: _personalTextControllers.linkedinController.text.isEmpty
          ? state.personalData.linkedin
          : _personalTextControllers.linkedinController.text,
      birthday: _personalTextControllers.birthdayController.text.isEmpty
          ? state.personalData.birthday
          : _personalTextControllers.birthdayController.text,
      imagePath: state.personalData.imagePath == null ||
              state.personalData.imagePath!.isEmpty
          ? state.personalData.imagePath
          : _imagePickerCubit.getChoosenImagePath,
    );
    return personalDataModel;
  }
}
