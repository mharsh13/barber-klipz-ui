import 'package:barber_klipz_ui/Providers/chat_base_model.dart';
import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:barber_klipz_ui/Screens/OnboardingScreen/onboarding_screen.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/shared_preference_util.dart';
import 'package:barber_klipz_ui/global.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Socket socket = io(Global.baseURL, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  @override
  void initState() {
    final baseModel = ref.read(splashScreenBaseModel);
    final chatModel = ref.read(chatBaseModel);
    execute(baseModel).then((value) {
      chatModel.connectSocket();
    });
    super.initState();
  }

  Future<void> execute(SplashScreenBaseModel baseModel) async {
    SharedPreferenceUtil.getJwt().then((value) async {
      if (value == "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      } else {
        await baseModel.getMe(context).then((isLoggedIn) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Center(
        child: TextUtil.primaryText(
          text: "Barber Klipz",
          color: kWhite,
          size: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
