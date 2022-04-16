import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tibetan_game/module/hangman_game/hangman_game_page.dart';
import 'package:tibetan_game/module/home.dart';
import 'package:tibetan_game/module/spelling_bee/speeling_bee_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HomePage.routeName:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
      case HangManGamePage.routeName:
        return CupertinoPageRoute(
          builder: (_) => const HangManGamePage(),
        );
      case SpellingBeePage.routeName:
        return CupertinoPageRoute(
          builder: (_) => const SpellingBeePage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error occur'),
        ),
      );
    });
  }
}
