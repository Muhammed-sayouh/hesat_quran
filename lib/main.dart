import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/porviders.dart';
import 'package:hesat_quran/ui/screens/spalsh_screen/spalsh_screen.dart';
import 'package:hesat_quran/ui/theme/style/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: GetMaterialApp(
        home: const SplashScreen(),
        theme: getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}