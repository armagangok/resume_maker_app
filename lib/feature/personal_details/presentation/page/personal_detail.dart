import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/custom_appbar.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  late final TextEditingController nameController;
  late final TextEditingController cityController;
  late final TextEditingController numberController;
  late final TextEditingController emailController;
  late final TextEditingController linkedinController;
  late final TextEditingController birthdayController;

  @override
  void initState() {
    nameController = TextEditingController();
    cityController = TextEditingController();
    numberController = TextEditingController();
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
        onTap: () {},
        child: CircleAvatar(
          radius: context.height(0.125),
          backgroundColor: Colors.grey,
          child: Builder(
            builder: (context) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.person_fill,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      "Press to add an image.",
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

  Widget get _informationTextStack => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _personalInformationText,
          _nameTextField,
          _cityTextField,
          _numberTextField,
          _emailTextField,
          _linkedinTextField,
          _birthDayTextField,
        ],
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
          onPressed: () {},
          child: const Text("Save"),
        ),
      );

  TextField get _nameTextField => TextField(
        controller: nameController,
        decoration: const InputDecoration(hintText: "Name"),
      );

  TextField get _cityTextField => TextField(
        controller: cityController,
        decoration: const InputDecoration(hintText: "Location"),
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
