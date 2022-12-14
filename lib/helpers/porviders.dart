import 'package:flutter/cupertino.dart';
import 'package:hesat_quran/services/add_note_service.dart';
import 'package:hesat_quran/services/contact_us.dart';
import 'package:hesat_quran/services/delete_mission_service.dart';
import 'package:hesat_quran/services/delete_note_service.dart';
import 'package:hesat_quran/services/save_sora_service.dart';
import 'package:hesat_quran/ui/screens/add_notes/add_notes_screen.dart';
import 'package:hesat_quran/ui/screens/contact_us/contact_us_screen.dart';
import 'package:hesat_quran/view_model/home_view_model.dart';
import 'package:hesat_quran/view_model/missions_view_model.dart';
import 'package:hesat_quran/view_model/notes_view_model.dart';
import 'package:hesat_quran/view_model/sora_details_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../services/add_mission_service.dart';
import '../view_model/page_manager.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => SoraDetialsViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => AddNoteService(),
  ),
  ChangeNotifierProvider(
    create: (context) => NotesViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => DeleteNoteService(),
  ),
  ChangeNotifierProvider(
    create: (context) => DeleteMissionService(),
  ),
  ChangeNotifierProvider(
    create: (context) => MissionsViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => AddMissionService(),
  ),
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(),
  ),
  ChangeNotifierProvider(
    create: (context) => SaveSoraService(),
  ),
  ChangeNotifierProvider(
    create: (context) => PageManager(),
  ),
  ChangeNotifierProvider(
    create: (context) => ContactUsService(),
  ),
  ChangeNotifierProvider(
    create: (context) => ContactUsService(),
  ),
];
