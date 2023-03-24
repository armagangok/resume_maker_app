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
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: Injection.personalDataCubit.professionController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Full Name",
            controller: Injection.personalDataCubit.fullNameController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Birthday",
            controller: Injection.personalDataCubit.birthDayController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Country",
            controller: Injection.personalDataCubit.countryController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Zip Code",
            controller: Injection.personalDataCubit.zipCodeController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "City",
            controller: Injection.personalDataCubit.cityController,
          ),
        ),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Street",
            controller: Injection.personalDataCubit.streetController,
          ),
        ),
        SizedBox(height: 3 * KPadding.width20),
        SizedBox(
          child: UnderlinedTextField(
            hintText: "Phone",
            controller: Injection.personalDataCubit.phoneController,
          ),
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          hintText: "E-mail",
          controller: Injection.personalDataCubit.emailController,
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          hintText: "Link",
          controller: Injection.personalDataCubit.linkController,
        ),

        SizedBox(height: 3 * KPadding.width20),
        UnderlinedTextField(
          heigth: null,
          hintText: "Summary",
          controller: Injection.personalDataCubit.summaryController,
          maxLines: null,
        )
      ],
    );
  }
}
