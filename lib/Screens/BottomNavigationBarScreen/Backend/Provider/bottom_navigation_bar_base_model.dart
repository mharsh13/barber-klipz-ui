import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../AddScreen/add_screen.dart';
import '../../../ExploreScreen/explore_screen.dart';
import '../../../HomeScreen/home_screen.dart';
import '../../../NotificationScreen/notification_screen.dart';
import '../../../ProfileScreen/profile_screen.dart';

final bottomNavigationBarBaseModel =
    ChangeNotifierProvider((ref) => BottomNavigationBarBaseModel(ref));

class BottomNavigationBarBaseModel extends ChangeNotifier {
  final Ref ref;
  BottomNavigationBarBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentIndex = 0;
  final _screens = const [
    HomeScreen(),
    ExploreScreen(),
    AddScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  List<BottomNavigationBarItem> navBarItems() {
    return [
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home_rounded,
          size: 30,
          color: kYellow,
        ),
        label: "Home",
        tooltip: "",
        icon: Icon(
          Icons.home_rounded,
          size: 30,
          color: kBlack1,
        ),
      ),
      const BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.search,
            size: 30,
            color: kYellow,
          ),
          label: "Explore",
          tooltip: "",
          icon: Icon(
            Icons.search_sharp,
            size: 30,
            color: kBlack1,
          )),
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.add,
          size: 35,
          color: kYellow,
        ),
        label: "Add Post",
        tooltip: "",
        icon: Icon(
          Icons.add,
          size: 35,
          color: kBlack1,
        ),
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          size: 30,
          color: kYellow,
        ),
        label: "Notification",
        tooltip: "",
        icon: Icon(
          Icons.notifications,
          size: 30,
          color: kBlack1,
        ),
      ),
      const BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.account_circle,
          size: 30,
          color: kYellow,
        ),
        label: "Profile",
        tooltip: "",
        icon: Icon(
          Icons.account_circle,
          size: 30,
          color: kBlack1,
        ),
      ),
    ];
  }

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  List<Widget> get screens => _screens;
  int get currentIndex => _currentIndex;

  //functions

  //changes the index on bottom navigation bar
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
