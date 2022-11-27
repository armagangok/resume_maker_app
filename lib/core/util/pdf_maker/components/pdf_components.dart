import 'package:pdf/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final width = PdfPageFormat.a4.availableWidth;
final height = PdfPageFormat.a4.availableHeight;

pw.Widget symmetricPadding(Widget widget) {
  return Padding(
    padding: pw.EdgeInsets.symmetric(
      horizontal: width * 0.03,
      vertical: width * 0.03,
    ),
    child: widget,
  );
}

pw.Widget get sizedBox015 => pw.SizedBox(
      height: height * 0.02,
    );

pw.Widget head1Text(String text) {
  return pw.Text(
    text,
    style: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
    ),
  );
}

pw.Widget sideTextBody(String text) {
  return pw.Builder(
    builder: (context) => pw.Text(
      text,
      style: Theme.of(context).defaultTextStyle.copyWith(
            fontSize: 10,
          ),
    ),
  );
}
