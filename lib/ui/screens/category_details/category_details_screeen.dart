import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/services/get_category_details.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';

import '../../../models/category_details_model.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final String categoryName;
  final String categoryId;
  final String soraId;
  const CategoryDetailsScreen(
      {Key? key,
      required this.categoryName,
      required this.categoryId,
      required this.soraId})
      : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  bool loader = false;
  CategoriesDetailsModelModel? categoriesDetailsModelModel;
  Future<void> fetchData(BuildContext context) async {
    loader = true;
    try {
      categoriesDetailsModelModel = await categoryDetailsService(
        catId: widget.categoryId,
        soraId: widget.soraId,
      );
      setState(() {
        loader = false;
      });
      print(categoriesDetailsModelModel);
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
      appBar: commonAppBar(context, widget.categoryName),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: loader
                ? const Center(child: CupertinoActivityIndicator())
                : Text(categoriesDetailsModelModel!.details),
          ),
        ),
      ),
    );
  }
}
