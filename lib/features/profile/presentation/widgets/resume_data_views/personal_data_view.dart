// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/export/export.dart';
import '../../../../../core/widget/buttons/add_new_item.dart';
import '../../../../../core/widget/buttons/text_field/text_field.dart';
import '../phone_new_item_builder.dart';
import '../profile_picture_widget.dart';
import 'email_new_item_builder.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
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
        SizedBox(height: 3 * KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Phone",
            controller: TextEditingController(),
          ),
        ),
        PhoneNewItemBuilder(
          cubit: Injection.newItemCubit,
        ),
        NewItemWidget(
          onTap: () => Injection.newItemCubit.addNewItem(),
        ),
        SizedBox(height: 3 * KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "E-mail",
            controller: TextEditingController(),
          ),
        ),
        EmailNewItemBuilder(
          cubit: Injection.emailItemCubit,
        ),
        NewItemWidget(
          onTap: () {
            Injection.emailItemCubit.addNewItem();
          },
        )
      ],
    );
  }
}
