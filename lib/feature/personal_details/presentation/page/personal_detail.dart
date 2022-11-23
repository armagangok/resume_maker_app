import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../../export/personal_export.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final PersonalTextControllerCubit _textControllers;
  late final PersonalDataCubit _personalDataCubit;
  late final PickImageCubit _imagePickerCubit;

  @override
  void initState() {
    _personalDataCubit = getIt<PersonalDataCubit>.call();
    _personalDataCubit.getPersonalData();
    _imagePickerCubit = getIt<PickImageCubit>.call();
    _textControllers = getIt<PersonalTextControllerCubit>.call();

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
        listener: (context, state) {
          if (state is PersonalDataSaved) {
            getSnackBar(context, PersonalDataSaved.message);
          } else if (state is PersonalDataCacheError) {
            getSnackBar(context, PersonalDataCacheError.message);
          }
        },
        bloc: _personalDataCubit,
        builder: (context, state) {
          if (state is PersonalDataInitial) {
            return getBodyWidgets(state);
          } else if (state is PersonalDataReceived) {
            return getBodyWidgets(state);
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
              File imageFile = File(personalDataState.personalData.imagePath!);

              return personalDataState.personalData.imagePath == null ||
                      personalDataState.personalData.imagePath!.isEmpty
                  ? const CircleAvatarLoading(
                      decorationImage: DecorationImage(
                        image: AssetImage(personImage),
                      ),
                    )
                  : CircleAvatarWidget(file: imageFile);
            } else if (imageState is ImageLoading) {
              return const ImageLoadingWidget();
            } else if (imageState is ImageLoaded) {
              File imageFile = File(imageState.imagePath!);

              return CircleAvatarWidget(file: imageFile);
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
        controller: _textControllers.locationController,
        decoration: InputDecoration(
          hintText:
              personalData.location == null || personalData.location!.isEmpty
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

            _textControllers.checkControllersIfEmpty()
                ? {}
                : {
                    await _personalDataCubit
                        .savePersonalData(personalDataModel),
                    _textControllers.clearControllers(),
                  };
          },
          child: const Text("Update"),
        ),
      );

  Widget _nameTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _textControllers.nameController,
        decoration: InputDecoration(
          hintText: (personalDataModel.name == null ||
                  personalDataModel.name!.isEmpty)
              ? "Name"
              : personalDataModel.name,
        ),
      );

  Widget _birthDayTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _textControllers.birthdayController,
        decoration: InputDecoration(
          hintText: (personalDataModel.birthday == null ||
                  personalDataModel.birthday!.isEmpty)
              ? "Birthday"
              : personalDataModel.birthday,
        ),
      );

  Widget _linkedinTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _textControllers.linkedinController,
        decoration: InputDecoration(
          hintText: personalDataModel.linkedin == null ||
                  personalDataModel.linkedin == ""
              ? "Linkedin"
              : personalDataModel.linkedin,
        ),
      );

  Widget _emailTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _textControllers.emailController,
        decoration: InputDecoration(
          hintText: (personalDataModel.email == null ||
                  personalDataModel.email!.isEmpty)
              ? "Email"
              : personalDataModel.email,
        ),
      );

  Widget _numberTextField(PersonalDataModel personalDataModel) => TextField(
        controller: _textControllers.numberController,
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
