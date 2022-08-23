import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/exption.dart';
import 'package:hesat_quran/services/add_mission_service.dart';
import 'package:hesat_quran/services/add_note_service.dart';
import 'package:hesat_quran/services/delete_mission_service.dart';
import 'package:hesat_quran/services/get_my_missions.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/my_mission_model.dart';
import '../ui/custom_widgets/custome_toast.dart';

class MissionsViewModel with ChangeNotifier {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  List<MyMissionsModel> missions = [];

  bool loader = false;

  bool getmissionsLoader = false;

  Future<void> selectTime(BuildContext context, Widget child) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      time.text = selectedTime.format(context).toString();
      notifyListeners();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date.text = DateFormat('yyyy-MM-dd').format(selectedDate).toString();
      notifyListeners();
    }
  }

  Future<void> addMission(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    loader = true;
    notifyListeners();
    try {
      await Provider.of<AddMissionService>(context, listen: false).addMission(
          details: details.text,
          title: title.text,
          time: time.text,
          date: date.text);
      loader = false;
      customToast(Constants.addedSucssefully);
      Get.back();
      notifyListeners();
    } on HttpExeption catch (err) {
      customToast(err.message);
      loader = false;
      notifyListeners();
    } catch (error) {
      customToast(Constants.noInternet);
      loader = false;
      notifyListeners();
    }
  }

  Future<void> deleteMission(BuildContext context, String noteId) async {
    notifyListeners();
    try {
      await Provider.of<DeleteMissionService>(context, listen: false)
          .deleteMission(id: noteId);
      loader = false;

      missions.removeWhere((element) => element.id == noteId);
      customToast(Constants.deletedSucssefully);

      notifyListeners();
    } on HttpExeption catch (err) {
      customToast(err.message);
      loader = false;
      notifyListeners();
    } catch (error) {
      customToast(Constants.noInternet);
      loader = false;
      notifyListeners();
    }
  }

  Future<void> fetchMission(BuildContext context) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    getmissionsLoader = true;
    try {
      missions = await myMissionsService();
      print(missions.length);
      getmissionsLoader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
