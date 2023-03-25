import '/core/export/export.dart';

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
            itemBuilder: (context, index) {
              var newItem = Injection.educationCubit.newItems[index];
              return Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Degree",
                    controller: newItem.degreeController!,
                  ),
                  UnderlinedTextField(
                    hintText: "School",
                    controller: newItem.majorController!,
                  ),
                  UnderlinedTextField(
                    hintText: "University",
                    controller: newItem.universityController!,
                  ),
                  UnderlinedTextField(
                    hintText: "Start Date",
                    controller: newItem.startDateController!,
                  ),
                  UnderlinedTextField(
                    hintText: "End Date",
                    controller: newItem.endDateController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  newItem.removeWidget ?? const SizedBox(),
                ],
              ),
            );
            },
          );
        },
      );

  EdgeInsets getPadding(int index) => index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}
