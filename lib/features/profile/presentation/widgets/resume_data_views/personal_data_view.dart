// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';

import '../../../../../core/export/export.dart';
import '../../../../../core/widget/buttons/add_new_item.dart';
import '../../cubit/new_item/new_item_cubit.dart';
import '../profile_picture_widget.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    _scrollToBottom() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }

    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: KPadding.width20),
        const ProfilePictureWidget(),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Full Name",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Birthday",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Country",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Zip Code",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "City",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Street",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: KPadding.width20),
        BlocBuilder<NewItemCubit, NewItemState>(
          bloc: Injection.newItemCubit,
          builder: (context, state) {
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: Injection.newItemCubit.newItems.length,
              itemBuilder: (context, index) {
                return RemovableTextField(
                  hintText: "",
                  controller: Injection.newItemCubit.newItems[index].controller,
                  onTapRemoveButton: () {
                    Injection.newItemCubit.removeItem(index);
                  },
                );
              },
            );
          },
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Phone",
            controller: TextEditingController(),
          ),
        ),
        const NewItemWidget()
      ],
    );
  }
}

class UnderlinedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  String? helperText;

  UnderlinedTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: white,
        decoration: InputDecoration(
          hintText: hintText,
          helperText: helperText,
        ),
      ),
    );
  }
}

class RemovableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final Function onTapRemoveButton;

  String? helperText;

  RemovableTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onTapRemoveButton,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        // scrollPadding: EdgeInsets.zero,
        controller: controller,
        cursorColor: white,
        decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            prefixIcon: GestureDetector(
              onTap: () => onTapRemoveButton(),
              child: const Icon(
                CupertinoIcons.minus_circle_fill,
                color: deleteRedColor,
              ),
            )),
      ),
    );
  }
}
