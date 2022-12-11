import 'package:flutter/material.dart';

import '../../../../core/export/core_export.dart';
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
    _languageCubit.fetchData();
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
        child: BlocConsumer<LanguageCubit, LanguageState>(
          listener: (context, state) {
            if (state is LanguageDeleted) {
              getSnackBar(context, "Language deleted succesfully.");
            } else if (state is LanguageSaved) {
              getSnackBar(context, "Laguage saved succesfully.");
            }
          },
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
    return CustomFloationgButton(
      onTap: () async {
        await bottomSheet(context);
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
