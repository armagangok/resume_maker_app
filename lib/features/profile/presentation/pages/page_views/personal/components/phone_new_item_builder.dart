// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../../../core/export/export.dart';
import '../../../../../../../core/widget/buttons/text_field/text_field.dart';
import '../../../../cubit/new_item/new_item_cubit.dart';

class PhoneNewItemBuilder extends StatelessWidget {
  const PhoneNewItemBuilder({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final dynamic cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewItemCubit, NewItemState>(
      bloc: cubit,
      builder: (context, state) {
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: cubit.newItems.length,
          itemBuilder: (context, index) {
            return RemovableTextField(
              hintText: "Phone",
              controller: cubit.newItems[index].controller,
              onTapRemoveButton: () {
                cubit.removeItem(index);
              },
            );
          },
        );
      },
    );
  }
}
