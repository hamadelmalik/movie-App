import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_assets.dart';
import 'package:movie_app/features/home/presentation/pages/browser_view.dart';
import 'package:movie_app/features/home/presentation/pages/home_view.dart';
import 'package:movie_app/features/home/presentation/pages/profile_view.dart';
import 'package:movie_app/features/home/presentation/pages/search_view.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final List<Widget>_page=[

    HomeView(),
    BrowserView(),
    SearchView(),
    ProfileView(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _page[_currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.home, width: 25),
          activeIcon: Image.asset(AppAssets.homeActive, width: 25),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.search, width: 25),
          activeIcon: Image.asset(AppAssets.searchActive, width: 25),
          label: "search",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.browser, width: 25),
          activeIcon: Image.asset(AppAssets.browserActive, width: 25),
          label: "Browser",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(AppAssets.profile, width: 25),
          activeIcon: Image.asset(AppAssets.profileActive, width: 25),
          label: "Profile",
        ),
      ],
    ),
    );
  }
}
