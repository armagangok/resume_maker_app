import 'package:resume_maker_app/core/export/export.dart';

import '../../data/models/data_tabbar_model.dart';
import '../widgets/data_category_item.dart';
import '../widgets/resume_data_views/education_data_view.dart';
import '../widgets/resume_data_views/experience_data_view.dart';
import '../widgets/resume_data_views/language_data_view.dart';
import '../widgets/resume_data_views/personal_data_view.dart';
import '../widgets/resume_data_views/qualifications_data_view.dart';
import '../widgets/resume_data_views/skills_data_view.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final controller = PageController();

  void selectCategory(int index) {
    for (var element in categoryList) {
      element.model.isSelected = false;
    }
    categoryList[index].model.isSelected = true;

    controller.page;

    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );

    emit(ProfileInitial());
  }

  List<CategoryTextWidget> categoryList = [
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: true,
        categoryName: "Personal",
      ),
    ),
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: false,
        categoryName: "Education",
      ),
    ),
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: false,
        categoryName: "Qualifications",
      ),
    ),
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: false,
        categoryName: "Skills",
      ),
    ),
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: false,
        categoryName: "Language",
      ),
    ),
    CategoryTextWidget(
      model: ResumeDataCategoryModel(
        isSelected: false,
        categoryName: "Experience",
      ),
    ),
  ];

  List<Widget> widgets = const [
    PersonalDataView(),
    EducationDataView(),
    QualificationsDataView(),
    SkillsDataView(),
    LanguageDataView(),
    ExperienceDataView(),
  ];
}
