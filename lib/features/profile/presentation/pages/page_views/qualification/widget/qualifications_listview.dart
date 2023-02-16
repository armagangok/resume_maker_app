import '../../../../../../../core/export/export.dart';

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
