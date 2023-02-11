// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/export/export.dart';
import '../profile_picture_widget.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const ProfilePictureWidget(),
        
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
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
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
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
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
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
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
            hintText: "Profession Title",
            helperText: "Example: Software Developer",
            controller: TextEditingController(),
          ),
        ),
      ],
    );
  }
}

class UnderlinedTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  final String helperText;

  const UnderlinedTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.helperText,
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
