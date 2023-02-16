// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../../../core/export/export.dart';

class ExperienceNewItemBuilder extends StatefulWidget {
  const ExperienceNewItemBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<ExperienceNewItemBuilder> createState() =>
      _ExperienceNewItemBuilderState();
}

class _ExperienceNewItemBuilderState extends State<ExperienceNewItemBuilder> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MultipleItemCubit, MultipleItemState>(
        bloc: Injection.experienceCubit,
        builder: (context, state) {
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: Injection.experienceCubit.newItems.length,
            itemBuilder: (context, index) => Padding(
              padding: getPadding(index),
              child: Column(
                children: [
                  UnderlinedTextField(
                    hintText: "Company",
                    controller:
                        Injection.experienceCubit.newItems[index].companyName!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Job Title",
                    controller:
                        Injection.experienceCubit.newItems[index].jobTitle!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Job Duties",
                    controller:
                        Injection.experienceCubit.newItems[index].jobDuties!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Start Date",
                    controller:
                        Injection.experienceCubit.newItems[index].jobStartDate!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "End Date",
                    controller:
                        Injection.experienceCubit.newItems[index].jobEndDate!,
                  ),
                  SizedBox(height: KPadding.height30),
                  Injection.experienceCubit.newItems[index].removeWidget!,
                ],
              ),
            ),
          );
        },
      );

  EdgeInsets getPadding(int index) =>
      index != 0 ? EdgeInsets.only(top: KPadding.height30) : EdgeInsets.zero;
}
