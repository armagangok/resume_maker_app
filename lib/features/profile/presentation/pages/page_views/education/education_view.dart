// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../widgets/multiple_item_builder.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MultipleNewItemBuilder(
          cubit: Injection.educationCubit,
        ),
        SizedBox(
          height: KPadding.height5,
        ),
        NewItemWidget(
          onTap: () {
            Injection.educationCubit.addNewItem();
          },
        ),
      ],
    );
  }
}

class RemoveNewItemWidget extends StatelessWidget {
  const RemoveNewItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Injection.educationCubit.removeItem(0),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.minus_circle_fill,
                color: deleteRedColor,
              ),
              SizedBox(
                width: KPadding.width20,
              ),
              Text(
                "Delete",
                style: context.bodyLarge.copyWith(color: white),
              ),
            ],
          ),
        ),
        BlocBuilder<MultipleItemCubit, MultipleItemState>(
          bloc: Injection.educationCubit,
          builder: (context, state) => Row(
            children: [
              _downWidget(),
              _upWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _upWidget() => Visibility(
        visible: checkIfOnlyDown(),
        child: Row(
          children: [
            SizedBox(width: KPadding.width5),
            GestureDetector(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 0,
                child: Icon(CupertinoIcons.triangle_fill),
              ),
            ),
          ],
        ),
      );

  Widget _downWidget() => Visibility(
        visible: checkIfOnlyUp(),
        child: GestureDetector(
          onTap: () {},
          child: const RotatedBox(
            quarterTurns: 2,
            child: Icon(CupertinoIcons.triangle_fill),
          ),
        ),
      );

  bool checkIfOnlyDown() {
    if (index == 0) {
      if (index == 0) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }

    // return index == 0 ? false : true;
  }

  bool checkIfOnlyUp() {
    // print("$index   ${Injection.educationCubit.newItems.length - 1}");

    if (index == Injection.educationCubit.newItems.length - 1) {
      if (index == Injection.educationCubit.newItems.length - 1) {
        return false;
      } else {
        return false;
      }
    } else {
      return true;
    }

    // return index ==  ? true : false;
  }
}




        // UnderlinedTextField(
        //   hintText: "Degree",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "School",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "University",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "Start Date",
        //   controller: TextEditingController(),
        // ),
        // UnderlinedTextField(
        //   hintText: "End Date",
        //   controller: TextEditingController(),
        // ),