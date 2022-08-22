import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';

void customToast(String msg  ,{bool shortLenth = true}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength:shortLenth? Toast.LENGTH_SHORT:Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,

      backgroundColor:AppColors.brownDarkColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
