import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/widget/export.dart';
import '../../../../injection_container.dart';
import '../../data/model/language_model.dart';
import '../cubit/language_cubit/language_cubit.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late final TextEditingController _langaugeController;
  late final LanguageCubit _languageCubit;

  @override
  void initState() {
    _langaugeController = TextEditingController();
    _languageCubit = getIt<LanguageCubit>.call();
    _languageCubit.fetchLanguageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addLanguageButton(),
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  Widget get _buildBody => Padding(
        padding: context.normalPadding,
        child: BlocBuilder<LanguageCubit, LanguageState>(
          bloc: getIt<LanguageCubit>.call(),
          builder: (context, state) {
            if (state is LanguageInitial) {
              return const Center(
                child: Text("Add languages into your resume."),
              );
            } else if (state is LanguageFetched) {
              return ListView.separated(
                itemBuilder: (context, index) => ListItemWidget(
                  text: state.languageData[index].language,
                  index: index,
                  onTap: () => _languageCubit.delete(index),
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
                itemCount: state.languageData.length,
              );
            } else {
              return const Text("elseee");
            }
          },
        ),
      );

  CustomAppBar get _buildAppBar => CustomAppBar(
        title: const Text("Languages"),
        onTapUpdate: () {},
      );

  Widget _addLanguageButton() {
    return Builder(builder: (context) {
      return CustomFloationgButton(
        onTap: () {
          bottomSheet(context);
        },
      );
    });
  }

  Future<dynamic> bottomSheet(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: context.normalPadding,
            child: ListView(
              children: [
                languageTextField(),
                addLanguageButton(),
              ],
            ),
          );
        },
      );

  Widget languageTextField() => TextField(
        controller: _langaugeController,
        decoration: const InputDecoration(
          hintText: "Language",
        ),
      );

  Widget addLanguageButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            var text = _langaugeController.text;
            (text.isNotEmpty)
                ? _languageCubit.save(
                    LanguageModel(language: _langaugeController.text),
                  )
                : getSnackBar(context, "Language cannot be empty");
            _langaugeController.clear();
          },
          child: const Text("Add Language"),
        ),
      );
}
