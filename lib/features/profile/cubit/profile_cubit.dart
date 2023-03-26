import '/core/export/export.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final pageController = PageController();

  void selectCategory(int index) {
    for (var element in categoryList) {
      element.model.isSelected = false;
    }
    categoryList[index].model.isSelected = true;

    pageController.page;

    pageController.animateToPage(
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
        categoryName: "Voluntary",
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
    VoluntaryView(),
    SkillsView(),
    LanguageView(),
    ExperienceView(),
  ];
}
