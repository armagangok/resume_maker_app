import 'package:flutter/material.dart';

import 'ios_dialog.dart';

Future<void> showCustomDialog(
    BuildContext context, int index, Function onLongTap) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return IosDeleteDialog(
        title: "Warning",
        message: "Would you like to delete  ${index + 1} th reference?",
        dialogAction: () => onLongTap(),
      );
    },
  );
}


// AlertDialog(
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(radius13)),
//         title: const Text('Alert Dialog'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               // Text('This is a demo alert dialog.'),
//               Text('Would you like to delete  $index.th reference?'),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Delete'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );