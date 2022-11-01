import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static const s20w500 = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.mainText,
      fontFamily: 'SourceSansPro');

  static const s16w400 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(21, 20, 31, 0.5),
      fontFamily: 'SourceSansPro');

  static const s13w200 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(138, 138, 143, 1),
      fontFamily: 'SourceSansPro');

  static const frame8566 = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
      fontFamily: 'SourceSansPro');
  static const s18w400 = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: 'SourceSansPro');
  static final textButton1 = TextButton.styleFrom(
    primary: Colors.white,
    textStyle: AppStyles.frame8566,
    backgroundColor: const Color.fromRGBO(155, 81, 224, 1),
  );
  static final textButton2 = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: const Color.fromRGBO(155, 81, 224, 1),
  );
  static final textButton3 = TextButton.styleFrom(
    backgroundColor: const Color.fromRGBO(155, 81, 224, 1),
  );
}
