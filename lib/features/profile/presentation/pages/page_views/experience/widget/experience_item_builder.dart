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
                    controller: Injection
                        .experienceCubit.newItems[index].companyNameController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Job Title",
                    controller: Injection
                        .experienceCubit.newItems[index].jobTitleController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Job Duties",
                    controller: Injection
                        .experienceCubit.newItems[index].jobDutiesController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "Start Date",
                    controller: Injection.experienceCubit.newItems[index]
                        .jobStartDateController!,
                  ),
                  SizedBox(height: KPadding.height5),
                  UnderlinedTextField(
                    hintText: "End Date",
                    controller: Injection
                        .experienceCubit.newItems[index].jobEndDateController!,
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
