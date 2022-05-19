import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tibetan_game/module/home.dart';
import 'package:tibetan_game/module/spelling_bee/provider/controller.dart';
import 'package:tibetan_game/module/spelling_bee/speeling_bee_page.dart';
import 'package:tibetan_game/util/route_generator.dart';
import 'package:tibetan_game/util/service_locator.dart';

void main() async {
  //await Firebase.initializeApp();
  //MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  GetIt.I.isReady<SharedPreferences>().then((_) {
    runApp(ChangeNotifierProvider<Controller>(
      create: (BuildContext context) => Controller(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tseymo - Tibetan Game',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'jomolhari',
          textTheme: TextTheme(
              headline1: TextStyle(
            fontFamily: 'jomolhari',
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))),
      initialRoute: SpellingBeePage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
