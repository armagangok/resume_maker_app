import '../../../../../../../core/export/export.dart';

class SkillsNewItemBuilder extends StatelessWidget {
  const SkillsNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.skillsCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.skillsCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Skill",
                    controller: Injection.skillsCubit.newItems[index].skillsController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  Injection.skillsCubit.newItems[index].removeWidget!,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}
