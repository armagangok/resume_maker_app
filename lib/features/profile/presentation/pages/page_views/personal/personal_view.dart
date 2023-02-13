// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';

import 'components/profile_picture_widget.dart';
import '../../../widgets/single_new_item_builder.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const ProfilePictureWidget(),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Full Name",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Birthday",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Country",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Zip Code",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "City",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Street",
            controller: TextEditingController(),
          ),
        ),
        SizedBox(height: 3 * KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Phone",
            controller: TextEditingController(),
          ),
        ),
        SingleNewItemBuilder(
          cubit: Injection.phoneItemCubit,
          hintText: 'Phone',
        ),
        NewItemWidget(
          onTap: () => Injection.phoneItemCubit.addNewItem(),
        ),
        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          hintText: "E-mail",
          controller: TextEditingController(),
        ),
        SingleNewItemBuilder(
          cubit: Injection.emailItemCubit,
          hintText: "E-mail",
        ),
        NewItemWidget(
          onTap: () {
            Injection.emailItemCubit.addNewItem();
          },
        ),
        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          hintText: "Link",
          controller: TextEditingController(),
        ),
        SingleNewItemBuilder(
          cubit: Injection.linkItemCubit,
          hintText: "Link",
        ),
        NewItemWidget(
          onTap: () {
            Injection.linkItemCubit.addNewItem();
          },
        ),
        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          heigth: null,
          hintText: "Summary",
          controller: TextEditingController(),
          maxLines: null,
        )
      ],
    );
  }
}
