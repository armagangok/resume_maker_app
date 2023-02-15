import '../../../../core/export/export.dart';

class MultipleNewItemBuilder extends StatelessWidget {
  const MultipleNewItemBuilder({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final dynamic cubit;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: cubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: cubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Degree",
                    controller: cubit.newItems[index].degreeController,
                  ),
                  UnderlinedTextField(
                    hintText: "School",
                    controller: cubit.newItems[index].schoolController,
                  ),
                  UnderlinedTextField(
                    hintText: "University",
                    controller: cubit.newItems[index].universityController,
                  ),
                  UnderlinedTextField(
                    hintText: "Start Date",
                    controller: cubit.newItems[index].startDateController,
                  ),
                  UnderlinedTextField(
                    hintText: "End Date",
                    controller: cubit.newItems[index].endDateController,
                  ),
                  SizedBox(height: KPadding.height5),
                  cubit.newItems[index].deleteWidget,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}
