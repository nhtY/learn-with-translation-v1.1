import 'package:flutter/material.dart';
import 'package:learn_with_translation/screens/sets/set_list_page.dart';
import 'package:learn_with_translation/screens/study/study_page.dart';
import 'package:learn_with_translation/screens/home/user_home_page.dart';

import 'constants.dart';
import "extentions/StringExtentions.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorTheme.primary,
          secondary: ColorTheme.secondary,
          onPrimary: ColorTheme.onPrimary,
          onSecondary: ColorTheme.onSecondary,
          background: ColorTheme.background,
          surface: ColorTheme.surface,
          error: ColorTheme.error,
          onBackground: ColorTheme.onBackground,
          onSurface: ColorTheme.onSurface,
          onError: ColorTheme.onError,
        ),
        primaryColor: ColorTheme.primary,
        backgroundColor: ColorTheme.background,
        primaryColorLight: ColorTheme.primaryLight,
        primaryColorDark: ColorTheme.primaryDark,
        fontFamily: 'OpenSans',
        textTheme: const TextTheme(
          headline5: TextStyle(fontWeight: FontWeight.normal, fontSize: 24, letterSpacing: 0),
          headline6: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 0.15),
          subtitle1: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0.15),
          subtitle2: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16, letterSpacing: 0.15),
          bodyText1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.5),
          bodyText2: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.5),
          button: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 1.25),
        )
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // When opening the app, show the left most tab
  int _currentTabIndex = 0;
  String _appBarTitle = "Home";

  /// The screens which will be shown when navigation bar items clicked.
  /// The order of the pages should be in line with the nav bars
  final _kTabPages = <Widget>[
    const HomePage(),
    const StudyPage(),
    const SetListPage()
  ];

  /// The navigation bar items which are clickable. When click on it, related page will be shown.
  final _kBottomNavBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_filled), label: 'home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.quiz_outlined), label: 'study'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.featured_play_list), label: 'sets'),

  ];

  @override
  Widget build(BuildContext context) {
    /// The number of pages and nav bar items must be equal
    assert(_kTabPages.length == _kBottomNavBarItems.length);

    /// Build the Bottom Navigation Bar by using the Bottom Navigation Bar Items list
    final bottomNavBar =  ClipPath(
      clipper: NavBarClipper(),
      child: Container(
        color: Colors.red,
        child: BottomNavigationBar(
            items: _kBottomNavBarItems,
            currentIndex: _currentTabIndex,
            type: BottomNavigationBarType.fixed,
            // Set the current index to the clicked tab's index..
            onTap: (int index) {
              setState(() {
                _currentTabIndex = index;
                // set the appbar title according to current screen
                _appBarTitle = _kBottomNavBarItems[index].label!;
                // Capitalize the first letter of the word
                _appBarTitle = _appBarTitle.capitalize();
                print("current tab index: $_currentTabIndex | $_appBarTitle");

              });
            }
        ),
      )
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(_appBarTitle))
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _kTabPages[_currentTabIndex], // show the clicked page
        bottomNavigationBar: bottomNavBar,
        extendBody: true, // available area == screeen OR (screen - bottomNavBar's height). If extended, we can use till very bottom.
        floatingActionButton: _currentTabIndex != 2 ? Container() :
        FloatingActionButton(
          onPressed: (){
            print("create a new set");
          },
          child: const Icon(
              Icons.add
          ),
        ),
      ),
    );
  }

}

class NavBarClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    Path path0 = Path();
    path0.moveTo(0, h);
    path0.quadraticBezierTo(w*0.05, 0, w*.1, 0);
    path0.lineTo(w*.9, 0);
    path0.quadraticBezierTo(w*.95, 0, w, h);
    path0.close();

    return path0;
    //throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

