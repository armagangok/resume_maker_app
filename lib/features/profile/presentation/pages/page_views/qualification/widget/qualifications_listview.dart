import '../../../../../../../core/export/export.dart';
import '../../../../../../../data/entities/entity.dart';
import '../../../../widgets/remove_new_item.dart';

class QualificationsNewItemBuilder extends StatelessWidget {
  const QualificationsNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.qualificationsCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.qualificationsCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Title",
                    controller:
                        Injection.qualificationsCubit.newItems[index].title!,
                  ),
                  UnderlinedTextField(
                    hintText: "School",
                    controller: Injection
                        .qualificationsCubit.newItems[index].schoolController!,
                  ),
                  UnderlinedTextField(
                    hintText: "Details",
                    controller:
                        Injection.qualificationsCubit.newItems[index].details!,
                  ),
                  SizedBox(height: KPadding.height5),
                  Injection.qualificationsCubit.newItems[index].removeWidget!,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}


class QualificationModel extends ModelEntity {
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
