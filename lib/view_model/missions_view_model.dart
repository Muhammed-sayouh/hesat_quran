import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/exption.dart';
import 'package:hesat_quran/services/add_note_service.dart';
import 'package:hesat_quran/services/delete_mission_service.dart';
import 'package:hesat_quran/services/get_my_missions.dart';
import 'package:hesat_quran/services/get_my_notes.dart';
import 'package:provider/provider.dart';

import '../models/my_mission_model.dart';
import '../models/my_notes_model.dart';
import '../services/delete_note_service.dart';
import '../ui/custom_widgets/custome_toast.dart';

class MissionsViewModel with ChangeNotifier {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();

  List<MyMissionsModel> missions = [];

  bool loader = false;

  bool getmissionsLoader = false;
  Future<void> addNote(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    bool done = Provider.of<AddNoteService>(context, listen: false).doneAddNote;
    loader = true;
    notifyListeners();
    try {
      done = await Provider.of<AddNoteService>(context, listen: false)
          .addNote(details: details.text, title: title.text);
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
