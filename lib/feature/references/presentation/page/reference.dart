import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';

import '../../../../global/widget/export.dart';
import '../cubit/references/references_cubit.dart';
import '../cubit/references/references_state.dart';

class ReferencesPage extends StatefulWidget {
  const ReferencesPage({Key? key}) : super(key: key);

  @override
  ReferencesScreenState createState() => ReferencesScreenState();
}

class ReferencesScreenState extends State<ReferencesPage> {
  final screenCubit = ReferencesCubit();
  late final TextEditingController nameController;
  late final TextEditingController professionController;
  late final TextEditingController emailController;
  late final TextEditingController phoneNumberController;

  @override
  void initState() {
    screenCubit.loadInitialData();
    nameController = TextEditingController();
    professionController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      floatingActionButton: _addReferenceButton,
      body: BlocConsumer<ReferencesCubit, ReferencesState>(
        bloc: screenCubit,
        listener: (BuildContext context, ReferencesState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, ReferencesState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return _buildBody;
        },
      ),
    );
  }

  Column get _buildBody => Column(
        children: const [],
      );

  TextField get _phoneNumberTextField => TextField(
        decoration: const InputDecoration(hintText: "Phone Number"),
        controller: phoneNumberController,
      );

  TextField get _emailController => TextField(
        decoration: const InputDecoration(hintText: "Reference Email"),
        controller: emailController,
      );

  TextField get _professionTextField => TextField(
        decoration: const InputDecoration(hintText: "Profession"),
        controller: professionController,
      );

  TextField get _nameTextController => TextField(
        decoration: const InputDecoration(hintText: "Name Surname"),
        controller: nameController,
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
                    _nameTextController,
                    _professionTextField,
                    _emailController,
                    _phoneNumberTextField,
                    SizedBox(
                      width: context.width(1),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Add As Reference"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
