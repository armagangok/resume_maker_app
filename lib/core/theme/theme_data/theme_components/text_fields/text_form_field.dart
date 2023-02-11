import 'package:google_fonts/google_fonts.dart';

import '../../../../export/export.dart';

InputDecorationTheme inputDecoration() {
  return InputDecorationTheme(
    // enabledBorder: UnderlineInputBorder(
    //   borderSide: BorderSide(
    //     color:  white,
    //   ),
    // ),

    // contentPadding: EdgeInsets.zero,
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: iconColor,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: iconColor,
      ),
    ),
    hintStyle: GoogleFonts.aBeeZee(
      color: iconColor.withOpacity(0.9),
      fontSize: 16,
      fontWeight: FontWeight.lerp(
        FontWeight.w100,
        FontWeight.w100,
        0,
      ),
    ),

    helperStyle: GoogleFonts.aBeeZee(
      color: const Color.fromARGB(255, 255, 149, 0).withOpacity(0.4),
      fontSize: 14,
      fontWeight: FontWeight.w100,
    ),
  );
}
