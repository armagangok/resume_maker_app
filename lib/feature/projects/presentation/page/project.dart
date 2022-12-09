import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
import '../cubit/project_cubit.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late final ProjectCubit _projectCubit;
  @override
  void initState() {
    _projectCubit = getIt<ProjectCubit>.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildAddProjectButton(),
    );
  }

  CustomAppBar _buildAppBar() => CustomAppBar(
        onTapUpdate: () {},
      );

  Widget _buildBody() {
    return BlocConsumer<ProjectCubit, ProjectState>(
      bloc: _projectCubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProjectInitial) {
          return const Center(
            child: Text("Please add your projects."),
          );
        } else {
          return ListView();
        }
      },
    );
  }

  Widget _buildAddProjectButton() {
    return CustomFloationgButton(
      onTap: () {
        bottomSheet(context);
      },
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: context.normalPadding,
            child: ListView(
              children: [
                _projectNameTextField(),
                _descriptipnTextField(),
                _sourceLinkTextField(),
              ],
            ),
          );
        },
      );

  TextField _sourceLinkTextField() {
    return TextField(
      controller: _projectCubit.sourceLinkController,
    );
  }

  TextField _descriptipnTextField() {
    return TextField(
      controller: _projectCubit.descriptionController,
    );
  }

  TextField _projectNameTextField() {
    return TextField(
      controller: _projectCubit.projectNameController,
    );
  }
}
