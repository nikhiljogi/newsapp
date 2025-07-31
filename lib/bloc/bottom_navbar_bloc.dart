import 'dart:async';

// ignore: constant_identifier_names
enum NavBarItem { HOME, SOURCES, SEARCH, ABOUT }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.SOURCES);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.SEARCH);
        break;
    }
  }

  close() {
    _navBarController.close();
  }
}
