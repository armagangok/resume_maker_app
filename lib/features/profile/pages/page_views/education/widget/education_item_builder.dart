import '../../../../../../../core/export/export.dart';

class EducationNewItemBuilder extends StatelessWidget {
  const EducationNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.educationCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.educationCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Degree",
                    controller: Injection
                        .educationCubit.newItems[index].degreeController!,
                  ),
                  UnderlinedTextField(
                    hintText: "School",
                    controller: Injection
                        .educationCubit.newItems[index].majorController!,
                  ),
                  UnderlinedTextField(
                    hintText: "University",
                    controller: Injection
                        .educationCubit.newItems[index].universityController!,
                  ),
                  UnderlinedTextField(
                    hintText: "Start Date",
                    controller: Injection
                        .educationCubit.newItems[index].startDateController!,
                  ),
                  UnderlinedTextField(
                    hintText: "End Date",
                    controller: Injection
                        .educationCubit.newItems[index].endDateController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  Injection.educationCubit.newItems[index].removeWidget ?? const SizedBox(),
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}
