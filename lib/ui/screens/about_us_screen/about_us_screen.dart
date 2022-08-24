import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/models/my_sitting_model.dart';
import 'package:hesat_quran/services/get_sitting.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';

// ignore: camel_case_types
class aboutUsScreen extends StatefulWidget {
  const aboutUsScreen({Key? key}) : super(key: key);

  @override
  State<aboutUsScreen> createState() => _aboutUsScreenState();
}

// ignore: camel_case_types
class _aboutUsScreenState extends State<aboutUsScreen> {
  bool loader = false;
  List<MySittingModel> sitting = [];
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
      appBar: commonAppBar(context, "من نحن"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: loader
                ? const Center(child: CupertinoActivityIndicator())
                : Center(child: Text(sitting[0].description)),
          ),
        ),
      ),
    );
  }
}
