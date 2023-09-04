// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';
import 'widget/skill_item_builder.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SkillsNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.skillsCubit.getUniqeID();
            var widget = SkillsModel(
              skillsController: TextEditingController(
                text: kDebugMode ? "Flutter" : null,
              ),
              itemID: itemId,
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.skillsCubit,
              ),
            );
            Injection.skillsCubit.addNewItem(widget);
          },
        ),
      ],
    );
  }
}

class SkillsModel extends UserDataEntity {
  @override
  final TextEditingController? skillsController;
  @override
  final String? itemID;
  @override
  RemoveNewItemWidget? removeWidget;

  SkillsModel({
    required this.skillsController,
    required this.itemID,
    required this.removeWidget,
  });
}