import 'package:barber_klipz_ui/Screens/ExploreScreen/Backend/Provider/explore_screen_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen>
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
    final baseModel = ref.watch(exploreScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        centerTitle: false,
        leadingWidth: screenUtil.setWidth(10),
        title: TextUtil.secondaryText(
          text: "Explore Screen",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(15),
            horizontal: screenUtil.setWidth(12),
          ),
          child: Column(
            children: [
              Container(
                height: screenUtil.setHeight(40),
                decoration: BoxDecoration(
                  color: kBackgroundDropDown,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  cursorColor: kBlack,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.only(top: 13, bottom: 13, left: 10),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(20),
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
                          text: 'Top Competitions',
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
                          text: 'Barbers',
                          color: kBlack,
                          size: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              baseModel.currentValue == 0 ? Container() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
