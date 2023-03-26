

import '../export/export.dart';

class Injection {
  Injection._();

  static final _phoneItemCubit = NewItemCubit();
  static final _emailItemCubit = NewItemCubit();
  static final _linkItemCubit = NewItemCubit();
  static final _skillsCubit = MultipleItemCubit();
  static final _educationCubit = MultipleItemCubit();
  static final _qualificationCubit = MultipleItemCubit();
  static final _languageCubit = MultipleItemCubit();
  static final _experienceCubit = MultipleItemCubit();

  static NavigationContract get navigator => getit.call<NavigationContract>();
  static ColorPickerCubit get colorPickerCubit => getit.call<ColorPickerCubit>();
  
  static PreviewCubit get previewCubit => getit.call<PreviewCubit>();
  static ProfileCubit get profileCubit => getit.call<ProfileCubit>();
  static NewItemCubit get phoneItemCubit => _phoneItemCubit;
  static NewItemCubit get emailItemCubit => _emailItemCubit;
  static NewItemCubit get linkItemCubit => _linkItemCubit;
  static MultipleItemCubit get skillsCubit => _skillsCubit;
  static MultipleItemCubit get languageCubit => _languageCubit;
  static MultipleItemCubit get educationCubit => _educationCubit;
  static MultipleItemCubit get voluntaryCubit => _qualificationCubit;
  static MultipleItemCubit get experienceCubit => _experienceCubit;
  static RootCubit get rootCubit => getit.call<RootCubit>();
  static HomeCubit get homeCubit => getit.call<HomeCubit>();
  static ResumeTemplateCubit get resumeTemplateCubit => getit.call<ResumeTemplateCubit>();
  static PersonalDataCubit get personalDataCubit => getit.call<PersonalDataCubit>();
  static ImageCubit get imageCubit => getit.call<ImageCubit>();
  static ExportCubit get exportCubit => getit.call<ExportCubit>();
}
