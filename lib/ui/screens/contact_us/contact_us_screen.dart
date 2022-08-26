import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/exption.dart';
import 'package:hesat_quran/helpers/validations.dart';
import 'package:hesat_quran/services/contact_us.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_textform.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/my_sitting_model.dart';
import '../../../services/get_sitting.dart';
import '../../custom_widgets/custom_images.dart';
import '../../custom_widgets/custome_toast.dart';
import '../../theme/style/colors.dart';
import '../../theme/style/font_style.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool loader = false;
  List<MySittingModel> sitting = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController supject = TextEditingController();

  bool submitLoader = false;

  Future<void> add(
      ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    print('xxxx');

    submitLoader = true;

    try {
      await Provider.of<ContactUsService>(context, listen: false)
          .contactUsSrevices(
              name: name.text,
              phone: phone.text,
              supject: title.text,
              message: supject.text);

      setState(() {
        submitLoader = false;
      });

      customToast("تم الإرسال بنجاح");
      // Get.back();
      // notifyListeners();
    } on HttpExeption catch (err) {
      customToast(err.message);
      setState(() {
        submitLoader = false;
      });
    } catch (error) {
      customToast(Constants.noInternet);

      setState(() {
        submitLoader = false;
      });
    }
  }

  Future<void> fetchData(BuildContext context) async {
    loader = true;
    try {
      sitting = await getMySittingService();
      print(sitting.length);
      setState(() {
        loader = false;
      });
    } catch (error) {
      rethrow;
    }
  }

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "اتصل بنا"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: commonPaddingHorizental(context),
          child: loader
              ? const CupertinoActivityIndicator()
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async{

                            await launchUrl(Uri.parse("tel:${sitting[3].description}"));
                          },
                          child: ListTile(
                            dense: true,
                            leading: Container(
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  color: AppColors.gray,
                                  shape: BoxShape.circle),
                              child: const CustomAssetImage(
                                imagePath: Constants.phoneIcon,
                                width: 22,
                              ),
                            ),
                            title: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                sitting[3].description,
                                textDirection: TextDirection.ltr,
                                style: mediumBlackFont().copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const BigPadding(),
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            dense: true,
                            leading: Container(
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  color: AppColors.gray,
                                  shape: BoxShape.circle),
                              child: const CustomAssetImage(
                                imagePath: Constants.locationIcon,
                                width: 22,
                              ),
                            ),
                            title: Text(
                              sitting[4].description,
                              style: mediumBlackFont().copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        const BigPadding(),
                        const BigPadding(),
                        Text(
                          'تواصل معنا :',
                          style: bigBlackFont().copyWith(
                              color: AppColors.brownDarkColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const BigPadding(),
                        CustomTextFieldAddMission(
                          title: "الإسم بالكامل",
                          controller: name,
                          validator: (val) =>
                              Validations.validationrequiredField(val!),
                        ),
                        CustomTextFieldAddMission(
                          title: "رقم الجوال",
                          controller: phone,
                          validator: (val) =>
                              Validations.validationrequiredField(val!),
                          keyboardType: TextInputType.phone,
                        ),
                        CustomTextFieldAddMission(
                          title: "عنوان الرساله",
                           controller: title,
                          validator: (val) =>
                              Validations.validationrequiredField(val!),
                        ),
                        CustomTextFieldAddMission(
                          title: "نص الرساله",
                          controller: supject,
                          validator: (val) =>
                              Validations.validationrequiredField(val!),
                          maxLines: 6,
                        ),
                        const BigPadding(),
                        const BigPadding(),
                       Center(
                          child:submitLoader? const CupertinoActivityIndicator():CustomButton(
                            onTap: () => add(),
                            title: "ارسال",
                            fontSized: 14,
                          ),
                        ),
                        const BigPadding(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
