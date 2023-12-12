import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/Backend/Provider/bottom_navigation_bar_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';

class BottomNavigationBarScreen extends ConsumerStatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  ConsumerState<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends ConsumerState<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(bottomNavigationBarBaseModel);
    return Scaffold(
      body: baseModel.screens[baseModel.currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          elevation: 30,
          items: baseModel.navBarItems(),
          currentIndex: baseModel.currentIndex,
          onTap: (index) {
            baseModel.setIndex(index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          selectedFontSize: 0,
          iconSize: 0,
          unselectedFontSize: 0,
        ),
      ),
    );
  }
}
