import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/Logic/controllers/Product_controller.dart';
import 'package:flutter_e_commers/Logic/controllers/Theme_controller.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:flutter_e_commers/utils/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProdcutController());
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
              title: 'M&N Store',
              theme: ThemesApp.light,
              darkTheme: ThemesApp.dark,
              themeMode: Themcontroller().ThemeDataget,
              debugShowCheckedModeBanner: false,
              initialRoute: FirebaseAuth.instance.currentUser != null ||
                      GetStorage().read<bool>("auth") == true
                  ? Approutes.mainscreen
                  : Approutes.welcome,
              getPages: Approutes.routes,
            ));
  }
}
