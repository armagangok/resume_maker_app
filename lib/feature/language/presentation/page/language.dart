import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../global/widget/floating_action_button.dart';
import '../../../../global/widget/list_item_widget.dart';
import '../../../../global/widget/snackbar.dart';
import '../../../../injection_container.dart';
import '../bloc/language_cubit/language_cubit.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addLanguageButton(),
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LanguageCubit, LanguageState>(
      bloc: getIt<LanguageCubit>.call(),
      builder: (context, state) {
        return ListView.separated(
          itemBuilder: (context, index) => ListItemWidget(
            text: getIt<LanguageCubit>().languages[index],
            index: index,
            onTap: () => getIt<LanguageCubit>().removeLanguage(index),
          ),
          separatorBuilder: (context, index) => const SizedBox(),
          itemCount: getIt<LanguageCubit>().languages.length,
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Language"),
      // actions: [
      //   SizedBox(
      //     child: ElevatedButton(
      //       style: ElevatedButton.styleFrom(
      //         backgroundColor: Colors.white,
      //       ),
      //       onPressed: () {},
      //       child: Text(
      //         "Update",
      //         style: context.textTheme.bodySmall!.copyWith(
      //           color: Colors.blueGrey[900],
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

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
        controller: textEditingController,
        decoration: const InputDecoration(
          hintText: "Language",
        ),
      );

  Widget addLanguageButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            var text = textEditingController.text;
            (text.isNotEmpty)
                ? getIt<LanguageCubit>().addLanguage(text)
                : getSnackBar(context, "Language cannot be empty");
            textEditingController.clear();
          },
          child: const Text("Add Language"),
        ),
      );
}
