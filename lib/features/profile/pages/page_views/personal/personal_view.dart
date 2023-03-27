// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: KPadding.height10,
        ),
        // const ProfilePictureWidget(),
        SizedBox(height: KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Profession Title",
            controller: Injection.personalDataCubit.title,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Full Name",
            controller: Injection.personalDataCubit.fullNameController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Birthday",
            controller: Injection.personalDataCubit.birthDayController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Country",
            controller: Injection.personalDataCubit.countryController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Zip Code",
            controller: Injection.personalDataCubit.zipCodeController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "City",
            controller: Injection.personalDataCubit.cityController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Street",
            controller: Injection.personalDataCubit.streetController,
          ),
        ),
        SizedBox(height: 3 * KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            labelText: "Phone",
            controller: Injection.personalDataCubit.phoneController,
          ),
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          labelText: "E-mail",
          controller: Injection.personalDataCubit.emailController,
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          labelText: "Link",
          controller: Injection.personalDataCubit.linkController,
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          heigth: null,
          labelText: "Summary",
          controller: Injection.personalDataCubit.summaryController,
          maxLines: null,
        )
      ],
    );
  }
}
