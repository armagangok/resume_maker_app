import 'package:flutter/material.dart';
import 'package:resume_maker_app/global/widget/custom_appbar.dart';

import '../../../../core/extension/context_extension.dart';

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

  Widget get _buildBody {
    return ListView(
      padding: context.normalPadding,
      children: [
        _nameTextField(),
        _cityTextField(),
        _numberTextField(),
        _emailTextField(),
        _linkedinTextField(),
        _birthDayTextField(),
        _updateButton()
      ],
    );
  }

  ElevatedButton _updateButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text("Update"),
    );
  }

  TextField _nameTextField() => TextField(
        controller: nameController,
        decoration: const InputDecoration(hintText: "Name"),
      );

  TextField _cityTextField() => TextField(
        controller: cityController,
        decoration: const InputDecoration(hintText: "Location"),
      );

  TextField _birthDayTextField() => TextField(
        controller: birthdayController,
        decoration: const InputDecoration(hintText: "Birthday"),
      );

  TextField _linkedinTextField() => TextField(
        controller: linkedinController,
        decoration: const InputDecoration(hintText: "Linkedin"),
      );

  TextField _emailTextField() => TextField(
        controller: emailController,
        decoration: const InputDecoration(hintText: "Email"),
      );

  TextField _numberTextField() => TextField(
        controller: numberController,
        decoration: const InputDecoration(hintText: "Phone Number"),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Personal Details"),
        onTapUpdate: () {},
      );
}
