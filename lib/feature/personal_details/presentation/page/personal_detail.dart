import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../injection_container.dart';
import '../../data/model/personal_data_model.dart';
import '../cubit/personal_data/personal_data_cubit.dart';
import '../cubit/personal_text_controllers/personal_text_controllers_cubit.dart';
import '../cubit/pick_image/pick_image_cubit.dart';
import '../widget/custom_circle_avatar.dart';

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
            return getBodyWidgets(context, state);
          } else if (state is DataReceived) {
            return getBodyWidgets(context, state);
          } else {
            return const Text("else");
          }
        },
      );

  ListView getBodyWidgets(BuildContext context, DataReceivedContract state) {
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
  }

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
                  ? const CircleAvatarWidget(
                      assetImage: AssetImage('assets/person.png'),
                    )
                  : CircleAvatarWidget(
                      assetImage: AssetImage(imageFile.path),
                    );
            } else if (imageState is ImageLoading) {
              return CircleAvatarWidget(
                widget: Column(
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
              );
            } else if (imageState is ImageLoaded) {
              File imageFile = File(imageState.imagePath!);

              return CircleAvatarWidget(
                assetImage: AssetImage(imageFile.path),
              );
            } else {
              return const CircleAvatarWidget(
                widget: Text(
                  "Error while uploading image.",
                ),
              );
            }
          },
        ),
      );

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
            final personalDataModel =
                _personalDataCubit.preparePersonalDataModel(state);
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
}
