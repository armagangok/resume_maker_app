// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../core/export/export.dart';

class SingleNewItemBuilder extends StatelessWidget {
  final String hintText;

  const SingleNewItemBuilder({
    Key? key,
    required this.hintText,
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
              hintText: hintText,
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
