// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:resume_maker_app/data/entities/entity.dart';

import '../../../../../../core/export/export.dart';
import '../../../../../../core/widget/buttons/add_new_item.dart';
import '../../../widgets/remove_new_item.dart';
import 'widget/qualifications_listview.dart';

class QualificationsView extends StatelessWidget {
  const QualificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const QualificationsNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.qualificationsCubit.getUniqeID();
            var widget = QualificationModel(
              details: TextEditingController(),
              schoolController: TextEditingController(),
              title: TextEditingController(),
              itemID: itemId,
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.qualificationsCubit,
              ),
            );
            Injection.qualificationsCubit.addNewItem(widget);
          },
        ),
      ],
    );
  }
}

class QualificationModel extends UserDataEntity {
  @override
  final TextEditingController? title;
  @override
  final TextEditingController? schoolController;
  @override
  final TextEditingController? details;
  @override
  final String? itemID;
  @override
  RemoveNewItemWidget? removeWidget;

  QualificationModel({
    required this.title,
    required this.schoolController,
    required this.details,
    required this.itemID,
    required this.removeWidget,
  });
}
