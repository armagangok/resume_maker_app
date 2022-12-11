import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/custom_appbar.dart';
import '../../../../core/widget/custom_dialog.dart';
import '../../../../core/widget/custom_divider.dart';
import '../../../../core/widget/floating_action_button.dart';
import '../../../../core/widget/initial_state_widget.dart';
import '../../../../core/widget/snackbar.dart';
import '../cubit/project_cubit.dart';
import '../widget/project_item_widget.dart';
import '../../../../injection_container.dart';


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
    _projectCubit.fetchData();
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
        title: const Text("Projects"),
      );

  Widget _buildBody() {
    return BlocConsumer<ProjectCubit, ProjectState>(
      bloc: _projectCubit,
      listener: (context, state) {
        if (state is ProjectDeleted) {
          getSnackBar(context, ProjectDeleted.message);
        } else if (state is ProjectSaved) {
          getSnackBar(context, ProjectSaved.message);
        }
      },
      builder: (context, state) {
        if (state is ProjectInitial) {
          return const InitialStateWidget(
            text: "Add experiences into resume you have.",
          );
        } else if (state is ProjectFetched) {
          return ListView.separated(
            padding: context.normalPadding,
            itemBuilder: (context, index) => ProjectItemWidget(
              projectModel: state.experienceData[index],
              onLongPress: () => showCustomDialog(
                context,
                index,
                () => _projectCubit.delete(index),
              ),
            ),
            separatorBuilder: (context, index) => const CustomDivider(),
            itemCount: state.experienceData.length,
          );
        } else {
          return const Text("elseee");
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
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
            height: context.height(0.7),
            child: Padding(
              padding: context.normalPadding,
              child: ListView(
                children: [
                  _projectNameTextField(),
                  _descriptipnTextField(),
                  _sourceLinkTextField(),
                  SizedBox(height: context.normalHeight),
                  _saveProjectDataButton(),
                ],
              ),
            ),
          );
        },
      );

  TextField _descriptipnTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Description"),
      controller: _projectCubit.descriptionController,
    );
  }

  TextField _projectNameTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Project Name"),
      controller: _projectCubit.projectNameController,
    );
  }

  TextField _sourceLinkTextField() {
    return TextField(
      decoration: const InputDecoration(hintText: "Link"),
      controller: _projectCubit.sourceLinkController,
    );
  }

  ElevatedButton _saveProjectDataButton() {
    return ElevatedButton(
      onPressed: () async =>
          await _projectCubit.save(_projectCubit.getProjectModel),
      child: const Text("Save "),
    );
  }
}
