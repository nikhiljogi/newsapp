import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_24_7/bloc/bottom_navbar_bloc.dart';
import 'package:flutter_news_24_7/screens/tabs/home_screen.dart';
import 'package:flutter_news_24_7/screens/tabs/search_screen.dart';
import 'package:flutter_news_24_7/screens/tabs/sources_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_news_24_7/style/theme.dart' as style;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BottomNavBarBloc _bottomNavBarBloc;
  ValueNotifier<bool> isDarkTheme = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: HexColor("1C2833"),
      appBarTheme: AppBarTheme(
        backgroundColor: HexColor("1a1a2e"),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor("1a1a2e"),
        selectedItemColor: style.Colors.mainColor,
        unselectedItemColor: style.Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkTheme,
      builder: (context, isDark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark ? getDarkTheme() : getLightTheme(),
          home: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                title: const Text("Latest News"),
                actions: [
                  IconButton(
                    icon: Icon(
                      isDark ? Icons.wb_sunny : Icons.nights_stay,
                      color: Colors.white,
                    ),
                    onPressed: () => isDarkTheme.value = !isDarkTheme.value,
                    tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: StreamBuilder<NavBarItem>(
                stream: _bottomNavBarBloc.itemStream,
                initialData: _bottomNavBarBloc.defaultItem,
                builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
                  switch (snapshot.data!) {
                    case NavBarItem.HOME:
                      return HomeScreen();
                    case NavBarItem.SOURCES:
                      return SourceScreen();
                    case NavBarItem.SEARCH:
                      return SearchScreen();
                    default:
                      return Container();
                  }
                },
              ),
            ),
            bottomNavigationBar: StreamBuilder(
              stream: _bottomNavBarBloc.itemStream,
              initialData: _bottomNavBarBloc.defaultItem,
              builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark ? Colors.white24 : Colors.black12,
                        spreadRadius: 0,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: BottomNavigationBar(
                      iconSize: 20,
                      type: BottomNavigationBarType.fixed,
                      currentIndex: snapshot.data!.index,
                      onTap: _bottomNavBarBloc.pickItem,
                      items: const [
                        BottomNavigationBarItem(
                          label: "Home",
                          icon: Icon(EvaIcons.homeOutline),
                          activeIcon: Icon(EvaIcons.home),
                        ),
                        BottomNavigationBarItem(
                          label: "Sources",
                          icon: Icon(EvaIcons.gridOutline),
                          activeIcon: Icon(EvaIcons.grid),
                        ),
                        BottomNavigationBarItem(
                          label: "Search",
                          icon: Icon(EvaIcons.searchOutline),
                          activeIcon: Icon(EvaIcons.search),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
