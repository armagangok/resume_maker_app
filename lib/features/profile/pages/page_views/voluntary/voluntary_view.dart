// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../core/export/export.dart';
import 'widget/qualifications_listview.dart';

class VoluntaryView extends StatelessWidget {
  const VoluntaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const VoluntaryNewItemBuilder(),
        SizedBox(height: KPadding.height5),
        NewItemWidget(
          onTap: () {
            String itemId = Injection.voluntaryCubit.getUniqeID();
            var qualification = VoluntaryModel(
              voluntaryTitle: TextEditingController(
                text: kDebugMode ? "Core Team Member at Google Developers Group." : null,
              ),
              voluntaryDescription: TextEditingController(
                text: kDebugMode
                    ? "As a core team member, I have participated and organized different events with other GDG members. "
                    : null,
              ),
              itemID: itemId,
              removeWidget: RemoveNewItemWidget(
                itemID: itemId,
                cubit: Injection.voluntaryCubit,
              ),
            );
            Injection.voluntaryCubit.addNewItem(qualification);
          },
        ),
      ],
    );
  }
}

class VoluntaryModel extends UserDataEntity {
  @override
  final TextEditingController? voluntaryTitle;

  @override
  final TextEditingController? voluntaryDescription;
  @override
  final String? itemID;
  @override
  RemoveNewItemWidget? removeWidget;

  VoluntaryModel({
    required this.voluntaryTitle,
    required this.voluntaryDescription,
    required this.itemID,
    required this.removeWidget,
  });
}
