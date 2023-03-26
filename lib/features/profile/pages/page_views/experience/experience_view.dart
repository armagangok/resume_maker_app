// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';
import 'widget/experience_item_builder.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ExperienceNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.experienceCubit.getUniqeID();
            var widget = ExperienceModel(
              itemID: itemId,
              companyNameController: TextEditingController(
                text: kDebugMode ? "Brain Kingdom Trading" : null,
              ),
              jobTitleController: TextEditingController(
                text: kDebugMode ? "Mobile Application Developer" : null,
              ),
              jobDutiesController: TextEditingController(
                text: kDebugMode
                    ? "Cubit, Bloc, get_it, UI implementations, and bug fixing in the Tubazy App."
                    : null,
              ),
              jobStartDateController: TextEditingController(
                text: kDebugMode ? "2022" : null,
              ),
              jobEndDateController: TextEditingController(
                text: kDebugMode ? "2019" : null,
              ),
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.experienceCubit,
              ),
            );
            Injection.experienceCubit.addNewItem(widget);
          },
        ),
      ],
    );
  }
}

class ExperienceModel extends UserDataEntity {
  @override
  final TextEditingController companyNameController;
  @override
  final TextEditingController jobTitleController;
  @override
  final TextEditingController jobDutiesController;
  @override
  final TextEditingController jobStartDateController;
  @override
  final TextEditingController jobEndDateController;
  @override
  final String itemID;
  @override
  RemoveNewItemWidget? removeWidget;

  ExperienceModel({
    required this.companyNameController,
    required this.jobTitleController,
    required this.jobDutiesController,
    required this.jobStartDateController,
    required this.jobEndDateController,
    required this.itemID,
    required this.removeWidget,
  });
}
