// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as p;
// import 'package:printing/printing.dart';

// class MyProfile extends StatelessWidget {
//   const MyProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Profile'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             //List of pdf widgets
//             List<p.Widget> widgets = [];

//             //Profile image
//             final image = p.ClipOval(
//               child: p.Image(
//                 await imageFromAssetBundle('assets/person.png'),
//                 fit: p.BoxFit.cover,
//                 width: 300,
//                 height: 300,
//               ),
//             );

//             //container for profile image decoration
//             final container = p.Center(
//               child: p.Container(
//                 child: image,
//                 padding: const p.EdgeInsets.all(5),
//                 decoration: p.BoxDecoration(
//                   shape: p.BoxShape.circle,
//                   border: p.Border.all(
//                     color: PdfColors.blue,
//                     width: 10,
//                   ),
//                 ),
//               ),
//             );

//             //add decorated image container to widgets list
//             widgets.add(container);
//             widgets.add(p.SizedBox(height: 20)); //some space beneath image

//             //add all other data which may be in the form of list
//             //use a loop to create pdf widget and add it to list
//             //one by one
//             for (int i = 0; i < 4; i++) {
//               widgets.add(
//                 p.Text(
//                   'Heading',
//                   style: p.TextStyle(
//                     fontSize: 25,
//                     fontWeight: p.FontWeight.bold,
//                   ),
//                 ),
//               );
//               widgets.add(p.SizedBox(height: 5));
//               widgets.add(
//                 p.Text(
//                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed accumsan augue, ut tincidunt lectus. Vestibulum venenatis euismod eros suscipit rhoncus. Sed vulputate congue turpis ut cursus. Proin sollicitudin nulla vel nisi vulputate sagittis. Morbi neque mauris, auctor id posuere eu, egestas porttitor justo. Donec tempus egestas lorem in convallis. Quisque fermentum, augue ut facilisis pretium, risus dolor viverra est, ac consequat tellus risus vitae sapien. ',
//                   style: const p.TextStyle(color: PdfColors.grey),
//                 ),
//               );
//               widgets.add(p.SizedBox(height: 10));
//             }

//             //pdf document
//             final pdf = p.Document();
//             pdf.addPage(
//               p.MultiPage(
//                 pageFormat: PdfPageFormat.a4,
//                 build: (context) => widgets, //here goes the widgets list
//               ),
//             );
//             Printing.layoutPdf(
//               onLayout: (PdfPageFormat format) async => pdf.save(),
//             );
//           },
//           child: const Text('Print'),
//         ),
//       ),
//     );
//   }
// }
