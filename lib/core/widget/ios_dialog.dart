import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/injection/injection_service.dart';
import 'package:resume_maker_app/core/navigation/constant/routes.dart';
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
    required this.title,
    required this.message,
    required this.dialogAction,
  }) : super(key: key);

  final String title;
  final String message;
  final Function dialogAction;

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
            const Divider(
              height: 0,
              thickness: 1.5,
            ),

            IntrinsicHeight(
              child: _dialogButton(
                text: "Save Changes",
                onTap: () => dialogAction(),
              ),
            ),

            const Divider(
              height: 0,
              thickness: 1.5,
            ),

            IntrinsicHeight(
              child: _dialogButton(
                text: "Delete Changes",
                onTap: () {
                  Injection.navigator.navigaToClear(path: homePage);
                },
                color: Colors.red,
              ),
            ),

            // IntrinsicHeight(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       _dialogButton(
            //         text: "Discard",
            //         onTap: () => navigation.getBack(),
            //         color: Colors.red,
            //       ),
            //       const VerticalDivider(
            //         width: 0,
            //         thickness: 1.5,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Padding messageText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height(0.02)),
      child: Text(
        message,
        style: context.bodyLarge.copyWith(),
      ),
    );
  }

  Padding warningText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height(0.02)),
      child: Text(
        title,
        style: context.titleLarge.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _dialogButton({String? text, Function? onTap, Color? color}) {
    return Builder(builder: (context) {
      return Padding(
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
      );
    });
  }
}
