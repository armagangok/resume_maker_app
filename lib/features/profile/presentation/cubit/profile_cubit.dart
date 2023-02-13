import '../../../../core/export/export.dart';
import '../../data/models/data_tabbar_model.dart';
import '../pages/page_views/education/education_view.dart';
import '../pages/page_views/experience/experience_view.dart';
import '../pages/page_views/language/language_view.dart';
import '../pages/page_views/personal/personal_view.dart';
import '../pages/page_views/qualification/qualifications_view.dart';
import '../pages/page_views/skills/skills_view.dart';
import '../widgets/data_category_item.dart';

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
    PersonalView(),
    EducationView(),
    QualificationsView(),
    SkillsView(),
    LanguageView(),
    ExperienceView(),
  ];
}
