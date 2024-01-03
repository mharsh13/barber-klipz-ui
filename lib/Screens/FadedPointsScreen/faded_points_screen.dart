import 'package:barber_klipz_ui/Screens/FadedPointsScreen/Backend/Provider/faded_points_base_model.dart';
import 'package:barber_klipz_ui/Utils/button_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/screen_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';
import 'Components/faded_points.dart';
import 'Components/subscriptions.dart';

class FadedPointsScreen extends ConsumerStatefulWidget {
  const FadedPointsScreen({super.key});

  @override
  ConsumerState<FadedPointsScreen> createState() => _FadedPointsScreenState();
}

class _FadedPointsScreenState extends ConsumerState<FadedPointsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(fadedPointsBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Faded Points",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
        leadingWidth: screenUtil.setWidth(25),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cut_outlined,
              color: kWhite,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.star_border_outlined,
              color: kWhite,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            TabBar(
              labelPadding: const EdgeInsets.all(0),
              onTap: (int value) {
                baseModel.setValue(value);
              },
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) return kGrey;
                  return null;
                },
              ),
              padding: EdgeInsets.only(bottom: screenUtil.setHeight(1)),
              indicatorColor: kLicorice,
              controller: _tabController,
              tabs: [
                SizedBox(
                  width: screenUtil.screenWidth / 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenUtil.setHeight(10),
                    ),
                    child: Center(
                      child: TextUtil.secondaryText(
                        text: 'Faded Points',
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenUtil.screenWidth / 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: screenUtil.setHeight(10),
                    ),
                    child: Center(
                      child: TextUtil.secondaryText(
                        text: 'Subscriptions',
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            baseModel.currentValue == 0
                ? fadedPoints(screenUtil)
                : subscriptions(screenUtil),
          ],
        ),
      ),
    );
  }
}
