import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ts_community_app/common/widgets/colors.dart';
import 'package:ts_community_app/features/splash_screen/splash_screen.dart';

Future<void> main()  async {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);


  await GetStorage.init();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  final introdata = GetStorage();

  @override
  void initState(){
    super.initState();
    introdata.writeIfNull("display", false);
    introdata.write("access", '');
    introdata.write("user_id", '');

  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'TalntsApp',
        themeMode: ThemeMode.light,
        home: SplashScreen());
  }
}
