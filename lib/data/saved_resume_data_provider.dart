// import 'package:resume_maker_app/data/models/multiple_new_item.dart';

// import '/core/export/export.dart';

// class SavedResumeDataProvider {
//   SavedResumeDataProvider._();
//   static final shared = SavedResumeDataProvider._();

//    final _personalDataCubit = Injection.personalDataCubit;

//    UserData? _userData;
//    UserData? get getUserData => _userData;

//     void setupControllers(UserData newUserData) {
//     Injection.educationCubit.newItems.clear();

//     _personalDataCubit.fullNameController .text = newUserData.personal!.fullName!;
//     _personalDataCubit.birthDayController .text = newUserData.personal!.birthday!;
//     _personalDataCubit.cityController.text = newUserData.personal!.city!;
//     _personalDataCubit.countryController.text = newUserData.personal!.country!;
//     _personalDataCubit.emailController.text = newUserData.personal!.email!;
//     _personalDataCubit.linkController.text = newUserData.personal!.link!;
//     _personalDataCubit.phoneController.text = newUserData.personal!.phone!;
//     _personalDataCubit.title.text = newUserData.personal!.title!;
//     _personalDataCubit.summaryController.text = newUserData.personal!.summary!;
//     _personalDataCubit.zipCodeController.text = newUserData.personal!.zipCode!;
//     _userData = newUserData;



//     String itemId = Injection.educationCubit.getUniqeID();

//     for (var i = 0; i < newUserData.education!.length; i++) {
//       var education = newUserData.education![i];

//       var multipleNewItem = MultipleNewItem (
//         degreeController: TextEditingController(text: education.degree), 
//         majorController: TextEditingController(text: education.major), 
//         universityController: TextEditingController(text: education.university), 
//         startDateController: TextEditingController(text: education.startDate), 
//         endDateController: TextEditingController(text: education.endDate), 
//         itemID: itemId, 
//         removeWidget: RemoveNewItemWidget(
//           cubit: Injection.educationCubit,
//           itemID: itemId
//         ,),
//       );

      

//       //  var userDataEntity = UserDataEntity(
//       //   degreeController: 
//       //   majorController: ,
//       //   universityController: ,
//       //   startDateController: ,
//       //   endDateController: ,
//       //   removeWidget: RemoveNewItemWidget(
//       //     itemID: itemId, 
//       //     cubit: Injection.educationCubit,
//       //   ),
//       //  );

//        Injection.educationCubit.newItems.add(multipleNewItem);
      
//     }
  

//      for (var skill in newUserData.skills!) {

//        var userDataEntity = UserDataEntity(
//         skillsController: TextEditingController(text: skill.skillName),
//        );

//        Injection.educationCubit.newItems.add(userDataEntity);
              
//      }

     

//      for (var language in newUserData.languages!) {

//        var userDataEntity = UserDataEntity(
//         languageController: TextEditingController(text: language.languageName),
//         languageLevelSlider: SliderWidget(
//           title: language.languageName!, 
//           cubit: SliderCubit(),
//           )
//        );

//        Injection.educationCubit.newItems.add(userDataEntity);
              
//      }
//    }
// }