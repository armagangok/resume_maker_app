// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:resume_maker_app/core/theme/constants/colors.dart';

import '../extension/context_extension.dart';

// class IosDeleteDialog extends StatelessWidget {
//   const IosDeleteDialog({
//     Key? key,
//     required this.title,
//     required this.message,
//     required this.dialogAction,
//   }) : super(key: key);

//   final String title;
//   final String message;
//   final Function dialogAction;

//   @override
//   Widget build(BuildContext context) {
//     var navigation = getIt<NavigationService>.call();
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(13),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           warningText(context),
//           SizedBox(height: context.height(0.02)),
//           messageText(context),
//           const Divider(
//             height: 0,
//             thickness: 1.5,
//           ),
//           IntrinsicHeight(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _dialogButton(
//                   text: "Discard",
//                   onTap: () => navigation.pop(),
//                   color: Colors.red,
//                 ),
//                 const VerticalDivider(
//                   width: 0,
//                   thickness: 1.5,
//                 ),
//                 _dialogButton(
//                   text: "Okey",
//                   onTap: () {
//                     dialogAction();
//                     navigation.pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Padding messageText(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: context.height(0.02)),
//       child: Text(
//         message,
//         style: context.textTheme.bodyMedium!.copyWith(),
//       ),
//     );
//   }

//   Padding warningText(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: context.height(0.02)),
//       child: Text(
//         title,
//         style: context.textTheme.headlineSmall!.copyWith(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _dialogButton({String? text, Function? onTap, Color? color}) {
//     return Builder(builder: (context) {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: context.height(0.02),
//         ),
//         child: GestureDetector(
//           onTap: () => onTap == null ? () {} : onTap(),
//           child: SizedBox(
//             width: context.width(0.18),
//             child: FittedBox(
//               child: Text(
//                 text ?? "",
//                 maxLines: 1,
//                 style: context.textTheme.bodyMedium!.copyWith(
//                   color: color ?? Colors.blue.shade800,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }

////////////////////////////////////////////////////
////////////////////////////////////////////////////
/// IOS CHOICE DIALOG //////////////////////////////

class IosChoiceDialog extends StatelessWidget {
  const IosChoiceDialog({
    Key? key,

     this.action1,
     this.action2,
     this.action3,
    required this.title,
    required this.message,
    
  }) : super(key: key);

  final DialogAction? action1;
  final DialogAction? action2;
  final DialogAction? action3;

  final String title;
  final String message;
  

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Dialog(
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            warningText(context),
            SizedBox(height: context.height(0.02)),
            messageText(context),
            action1 != null ? _action1() : const SizedBox(),
            action2 != null ? _action2() : const SizedBox(),
            action3 != null ? _action3() : const SizedBox(),
                        
          ],
        ),
      ),
    );
  }

  Widget _action3() => Column(
            children: [
              const Divider(
                height: 0,
                thickness: 1.5,
              ),

              IntrinsicHeight(
                child: _dialogButton(
                  text: action3!.actionText,
                  onTap: () => action3!.action(),
                  color: Colors.red,
                ),
              ),
            ],
          );

  Widget _action1() => Column(
            children: [
              const Divider(
                height: 0,
                thickness: 1.5,
              ),
              IntrinsicHeight(
                child: _dialogButton(
                  text: action1!.actionText,
                  onTap: () => action1!.action(),
                ),
              ),
            ],
          );

  Widget _action2() => Column(
            children: [
              const Divider(
                height: 0,
                thickness: 1.5,
              ),

              IntrinsicHeight(
                child: _dialogButton(
                  text: action2!.actionText,
                  onTap: () => action2!.action(),
                  color: Colors.red,
                ),
              ),
            ],
          );

  Padding messageText(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: context.height(0.02)),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.bodyLarge.copyWith(),
        ),
      );

  Widget warningText(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: context.height(0.02)),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: context.titleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _dialogButton({String? text, Function? onTap, Color? color}) =>
      Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.height(0.02),
          ),
          child: GestureDetector(
            onTap: () => onTap == null ? () {} : onTap(),
            child: Text(
              text ?? "",
              maxLines: 1,
              style: context.bodyLarge.copyWith(
                color: color ?? selectedItemColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}


class DialogAction {
  final String actionText;
  final Function action;

  DialogAction({
    required this.actionText,
    required this.action,
  });
}
