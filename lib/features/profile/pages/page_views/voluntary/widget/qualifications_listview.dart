import '../../../../../../../core/export/export.dart';

class VoluntaryNewItemBuilder extends StatelessWidget {
  const VoluntaryNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.voluntaryCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.voluntaryCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    labelText: "Title",
                    controller: Injection
                        .voluntaryCubit.newItems[index].voluntaryTitle!,
                  ),
                  UnderlinedTextField(
                    labelText: "Details",
                    controller: Injection
                        .voluntaryCubit.newItems[index].voluntaryDescription!,
                  ),
                  SizedBox(height: KPadding.height5),
                  Injection.voluntaryCubit.newItems[index].removeWidget!,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}

class QualificationModel extends UserDataEntity {
  @override
  final TextEditingController? title;
  @override
  final TextEditingController? schoolController;
  @override
  final TextEditingController? description;
  @override
  final String? itemID;
  @override
  RemoveNewItemWidget? removeWidget;

  QualificationModel({
    required this.title,
    required this.schoolController,
    required this.description,
    required this.itemID,
    required this.removeWidget,
  });
}
