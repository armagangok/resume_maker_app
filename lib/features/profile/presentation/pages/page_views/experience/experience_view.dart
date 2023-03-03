// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/data/entities/entity.dart';

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../widgets/remove_new_item.dart';
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
                text: checkIfDebugMode(text: "Brain Kingdom Trading"),
              ),
              jobTitleController: TextEditingController(
                text: checkIfDebugMode(text: "Mobile Application Developer"),
              ),
              jobDutiesController: TextEditingController(
                text: checkIfDebugMode(
                    text:
                        "Cubit, Bloc, get_it, UI implementations, and bug fixing in the Tubazy App."),
              ),
              jobStartDateController: TextEditingController(
                text: checkIfDebugMode(text: "2022"),
              ),
              jobEndDateController: TextEditingController(
                text: checkIfDebugMode(text: "2019"),
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
