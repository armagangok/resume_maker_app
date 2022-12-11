import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/asset_constant.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/snackbar.dart';
import '../../data/model/personal_data_model.dart';
import '../cubit/personal_data/personal_data_cubit.dart';
import '../cubit/pick_image/pick_image_cubit.dart';
import '../widget/custom_circle_avatar.dart';
import '../../../../injection_container.dart';


class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final PersonalDataCubit _personalDataCubit;
  late final PickImageCubit _imagePickerCubit;

  @override
  void initState() {
    _imagePickerCubit = getIt<PickImageCubit>.call();
    _personalDataCubit = getIt<PersonalDataCubit>.call();
    _personalDataCubit.fetchPersonalData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  Widget get _buildBody => BlocConsumer<PersonalDataCubit, PersonalDataState>(
        listener: (context, personalDataState) {
          if (personalDataState is PersonalDataSaved) {
            getSnackBar(context, PersonalDataSaved.message);
          } else if (personalDataState is PersonalDataFetchError) {
            getSnackBar(context, PersonalDataFetchError.message);
          }
        },
        bloc: _personalDataCubit,
        builder: (context, personalState) {
          if (personalState is PersonalDataInitial) {
            return getBodyWidgets(personalState);
          } else if (personalState is PersonalDataReceived) {
            return getBodyWidgets(personalState);
          } else {
            return const Text("data");
          }
        },
      );

  Widget getBodyWidgets(DataReceivedContract state) => Builder(
        builder: (context) => ListView(
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
        ),
      );

  Widget _uploadImageButton(DataReceivedContract personalDataState) => InkWell(
        onTap: () async {
          await _imagePickerCubit.pickImage();
        },
        child: BlocConsumer<PickImageCubit, PickImageState>(
          listener: (context, state) {
            if (state is ImageLoaded) {
              getSnackBar(context, ImageLoaded.message);
            } else if (state is LoadError) {
              getSnackBar(context, LoadError.message);
            }
          },
          bloc: _imagePickerCubit,
          builder: (context, imageState) {
            if (imageState is PickImageInitial) {
              if (personalDataState.personalData.imagePath.isEmpty) {
                return const InitialImage(
                  decorationImage: DecorationImage(
                    image: AssetImage(personImage),
                  ),
                );
              } else {
                File imageFile = File(personalDataState.personalData.imagePath);
                return UserImageWidget(file: imageFile);
              }
            } else if (imageState is ImageLoading) {
              return const ImageLoadingWidget();
            } else if (imageState is ImageLoaded) {
              File imageFile = File(imageState.imagePath);
              return UserImageWidget(file: imageFile);
            } else {
              return const ImageLoadingErrorWidgget();
            }
          },
        ),
      );

  Widget _informationTextStack(DataReceivedContract state) {
    var personalData = state.personalData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _personalInformationText,
        _aboutMeTextField(state.personalData),
        _nameTextField(personalData),
        _locationTextField(personalData),
        _numberTextField(personalData),
        _emailTextField(personalData),
        _linkedinTextField(personalData),
        _birthDayTextField(personalData),
      ],
    );
  }

  Widget _locationTextField(PersonalDataModel personalData) => TextField(
        controller: _personalDataCubit.locationController,
        decoration: InputDecoration(
          hintText: personalData.location.isEmpty
              ? "Location"
              : personalData.location,
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

            print(_imagePickerCubit.getImageFile.path);

            _personalDataCubit.checkControllersIfEmpty()
                ? {}
                : {
                    await _personalDataCubit
                        .savePersonalData(personalDataModel),
                    _personalDataCubit.clearControllers(),
                  };
          },
          child: const Text("Update"),
        ),
      );

  Widget _nameTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.nameController,
        decoration: InputDecoration(
          hintText: (personalDataModel.name.isEmpty)
              ? "Name"
              : personalDataModel.name,
        ),
      );

  Widget _birthDayTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.birthdayController,
        decoration: InputDecoration(
          hintText: (personalDataModel.birthday.isEmpty)
              ? "Birthday"
              : personalDataModel.birthday,
        ),
      );

  Widget _linkedinTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.linkedinController,
        decoration: InputDecoration(
          hintText: personalDataModel.linkedin == ""
              ? "Linkedin"
              : personalDataModel.linkedin,
        ),
      );

  Widget _emailTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.emailController,
        decoration: InputDecoration(
          hintText: (personalDataModel.email.isEmpty)
              ? "Email"
              : personalDataModel.email,
        ),
      );

  Widget _aboutMeTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.aboutMeController,
        decoration: InputDecoration(
          hintText: (personalDataModel.aboutMeText.isEmpty)
              ? "About Me"
              : personalDataModel.aboutMeText,
        ),
        maxLines: null,
      );

  Widget _numberTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _personalDataCubit.numberController,
        decoration: InputDecoration(
          hintText: personalDataModel.phoneNumber == ""
              ? "Phone Number"
              : personalDataModel.phoneNumber,
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );
}
