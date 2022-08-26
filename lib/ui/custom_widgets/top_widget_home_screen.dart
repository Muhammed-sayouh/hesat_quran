import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_textform.dart';
import 'package:hesat_quran/ui/custom_widgets/custome_toast.dart';
import 'package:hesat_quran/ui/screens/sora_details_screen/sora_details_screen.dart';

import '../../models/search_model.dart';
import '../../services/get_my_search.dart';
import '../theme/sizes/sizes.dart';
import 'drop_dwon_text_fild.dart';

class TopWidgetHomeScreen extends StatefulWidget {
  const TopWidgetHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TopWidgetHomeScreen> createState() => _TopWidgetHomeScreenState();
}

class _TopWidgetHomeScreenState extends State<TopWidgetHomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<SearchModel> serachList = [];
  Future<void> search() async {
  if (searchController.text.isNotEmpty) {
      try {
      serachList = await searchService(searchController.text);
      print(serachList.length);
    } catch (error) {
      rethrow;
    }
  } else {
    customToast('يرجي ادخال كلمة البحث');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextFormFild(
          hint: 'بحث',
          controller: searchController,
          onTap: () => search().then((value) {
            if (serachList.isNotEmpty) {
              Get.to(() => SoraDetailsScreen(
                  page: serachList[0].page, soraId: serachList[0].id));
            } else {
              customToast("لا يوجد نتائج لهذا البحث");
            }
          }),
        )),
        MediumPadding(
          horizental: true,
        ),
        Expanded(child: DropDown()),
      ],
    );
  }
}
