import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:resume_maker_app/core/export/export.dart';
import 'package:resume_maker_app/data/models/language/language.dart';
import 'package:resume_maker_app/features/design/presentation/pages/design_page.dart';
import 'package:resume_maker_app/features/export/presentation/pages/export_page.dart';

import '../../../../core/widget/ios_dialog.dart';
import '../../../../data/models/education/education.dart';
import '../../../../data/models/personal/personal.dart';
import '../../../../data/models/single_new_item_model.dart';
import '../../../../data/models/user_data_model/user_data.dart';
import '../../../preview/presentation/pages/preview_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const DesignPage(),
    const ProfilePage(),
    const PreviewPage(),
    const ExportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }

  AppBar _appBar() => AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: iconBackground,
            height: 0.5.h,
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu_rounded,
            size: 45,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: false,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.menu_rounded,
                  size: 45,
                ),
              ),
            ),
            Text(
              _getDate(),
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.cupertinoDialog(
                  widget: IosChoiceDialog(
                    title: "Warning",
                    message: "Do you wish to save your changes?",
                    dialogAction: () {
                      var personalData = Injection.personalDataCubit;
                      List<String> phones = [];
                      List<String> emails = [];
                      List<String> links = [];
                      phones.add(personalData.phoneController.text);
                      emails.add(
                        personalData.linkController.text,
                      );
                      links.add(
                        personalData.linkController.text,
                      );
                      for (NewItemModel phoneController
                          in Injection.phoneItemCubit.newItems) {
                        phones.add(phoneController.controller.text);
                      }
                      for (NewItemModel emailController
                          in Injection.emailItemCubit.newItems) {
                        emails.add(emailController.controller.text);
                      }
                      for (NewItemModel element
                          in Injection.linkItemCubit.newItems) {
                        links.add(element.controller.text);
                      }
                      Personal personalDataModel = Personal(
                        title: Injection
                            .personalDataCubit.professionTitleController.text,
                        fullName: personalData.fullNameController.text,
                        birthday: personalData.birthDayController.text,
                        country: personalData.countryController.text,
                        zipCode: personalData.zipCodeController.text,
                        city: personalData.cityController.text,
                        street: personalData.streetController.text,
                        phones: phones,
                        emails: emails,
                        links: links,
                        summary: personalData.summaryController.text,
                        imagePath: Injection.imageCubit.imagePath,
                      );

                      List<Education> educationData = [];

                      for (var element in Injection.educationCubit.newItems) {
                        educationData.add(Education(
                          degree: element.degreeController!.text,
                          school: element.schoolController!.text,
                          university: element.universityController!.text,
                          startDate: element.startDateController!.text,
                          endDate: element.endDateController!.text,
                        ));
                      }

                      List<Language> languageData = [];

                      for (var element in Injection.languageCubit.newItems) {
                        languageData.add(Language(
                          languageName: element.languageController!.text,
                          writing: "${Injection.languageCubit.writing}",
                          reading: "${Injection.languageCubit.reading}",
                          speaking: "${Injection.languageCubit.speaking}",
                        ));
                      }

                      for (var element in languageData) {
                        print(element);
                      }

                      UserData userData = UserData(
                        personal: personalDataModel,
                        education: educationData,
                        languages: languageData,
                        skills: [],
                        experiences: [],
                        qualifications: [],
                      );
                    },
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: selectedItemColor,
                child: Center(
                  child: Icon(
                    CupertinoIcons.checkmark_alt,
                    color: white,
                    size: 35.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  String _getDate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');
    final String formatted = formatter.format(now);

    return formatted;
  }

  Widget _bottomNavBar() => SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomNavigationBar(
              backgroundColor: Colors.black.withOpacity(0.1),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.photo_on_rectangle),
                  label: 'Design',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_circle_fill),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.eye_fill),
                  label: 'Preview',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_arrow_down_on_square_fill),
                  label: 'Export',
                ),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ],
        ),
      );
}



                      // print(personalDataModel.birthday);
                      // print(personalDataModel.city);
                      // print(personalDataModel.country);
                      // print(personalDataModel.fullName);
                      // print(personalDataModel.emails);
                      // print(personalDataModel.links);
                      // print(personalDataModel.phones);
                      // print(personalDataModel.street);
                      // print(personalDataModel.title);
                      // print(personalDataModel.summary);