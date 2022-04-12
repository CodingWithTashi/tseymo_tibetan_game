import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tibetan_game/module/home.dart';
import 'package:tibetan_game/util/route_generator.dart';
import 'package:tibetan_game/util/service_locator.dart';

void main() async {
  //await Firebase.initializeApp();
  //MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  GetIt.I.isReady<SharedPreferences>().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Tseymo - Tibetan Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'jomolhari',
      ),
      initialRoute: HomePage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const HomePage(),
    );
  }
}
