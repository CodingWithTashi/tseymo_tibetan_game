class Game {
  String _name;
  String _gameIcon;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Game({
    required String name,
    required String gameIcon,
  })  : _name = name,
        _gameIcon = gameIcon;

  String get gameIcon => _gameIcon;

  set gameIcon(String value) {
    _gameIcon = value;
  }

  static List<Game> gameList() {
    return [
      Game(name: 'Search Item', gameIcon: 'assets/images/ic_launcher.png'),
      Game(name: 'Endless Runner', gameIcon: 'assets/images/ic_launcher.png'),
      Game(name: 'Hangman', gameIcon: 'assets/images/ic_launcher.png'),
      Game(name: 'Spelling Bee', gameIcon: 'assets/images/ic_launcher.png'),
    ];
  }
}
