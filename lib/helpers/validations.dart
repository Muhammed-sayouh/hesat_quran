import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hesat_quran/helpers/constants.dart';

class Validations {
 static  String? validationrequiredField(String val){
     if (val.isEmpty) {
       return Constants.requiredField;
     } else {
       return null ;
     }
   }
}