import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../../core/navigation/navigation_service.dart';
import '../../injection_container.dart';

class IosDeleteDialog extends StatelessWidget {
  const IosDeleteDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.dialogAction,
  }) : super(key: key);

  final String title;
  final String message;
  final Function dialogAction;

  @override
  Widget build(BuildContext context) {
    var navigation = getIt<NavigationService>.call();
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          warningText(context),
          SizedBox(height: context.height(0.02)),
          messageText(context),
          const Divider(
            height: 0,
            thickness: 1.5,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dialogButton(
                  "Cancel",
                  () => navigation.getBack(),
                ),
                const VerticalDivider(
                  width: 0,
                  thickness: 1.5,
                ),
                _dialogButton(
                  "Okey",
                  () {
                    dialogAction();
                    navigation.getBack();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding messageText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height(0.02)),
      child: Text(
        message,
        style: context.textTheme.bodyText2!.copyWith(),
      ),
    );
  }

  Padding warningText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height(0.02)),
      child: Text(
        title,
        style: context.textTheme.headline5!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _dialogButton(String text, Function onTap) {
    return Builder(builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.height(0.02),
        ),
        child: SizedBox(
          width: context.width(0.18),
          child: GestureDetector(
            onTap: () => onTap(),
            child: FittedBox(
              child: Text(
                text,
                maxLines: 1,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
