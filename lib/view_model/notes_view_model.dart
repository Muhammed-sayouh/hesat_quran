import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/exption.dart';
import 'package:hesat_quran/services/add_note_service.dart';
import 'package:hesat_quran/services/get_my_notes.dart';
import 'package:provider/provider.dart';

import '../models/my_notes_model.dart';
import '../services/delete_note_service.dart';
import '../ui/custom_widgets/custome_toast.dart';

class NotesViewModel with ChangeNotifier {
  TextEditingController title = TextEditingController();
  TextEditingController details = TextEditingController();

  List<MyNotesModel> notes = [];

  bool loader = false;

  bool getNotesLoader = false;
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

  Future<void> deleteNote(BuildContext context, String noteId) async {
    notifyListeners();
    try {
      await Provider.of<DeleteNoteService>(context, listen: false)
          .deleteNote(id: noteId);
      loader = false;

      notes.removeWhere((element) => element.id == noteId);
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

  Future<void> fetchNotes(BuildContext context) async {
    Future.delayed(Duration.zero).then((value) => notifyListeners());
    getNotesLoader = true;
    try {
      notes = await myNotesService();
      print(notes.length);
      getNotesLoader = false;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
