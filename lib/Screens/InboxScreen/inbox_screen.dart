import 'package:barber_klipz_ui/Screens/NewMessageScreen/new_message_screen.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import 'Backend/Provider/inbox_base_model.dart';
import 'Components/all_requests.dart';

class InboxScreen extends ConsumerStatefulWidget {
  const InboxScreen({super.key});

  @override
  ConsumerState<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends ConsumerState<InboxScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    final baseModel = ref.read(inboxBaseModel);
    baseModel.getAllInbox(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(inboxBaseModel);
    final splashModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack2,
          title: TextUtil.secondaryText(
            text: splashModel.user!.user_name,
            color: kGold,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          leading: const BackButton(
            color: kWhite,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                NavigatorUtil.push(
                  context,
                  screen: const NewMessageScreen(),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
                child: const Icon(
                  Icons.edit_square,
                  color: kWhite,
                ),
              ),
            )
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
                          text: 'All',
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
                          text: 'Requests',
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
                  ? allRequests(screenUtil, baseModel)
                  : Container(
                      margin: EdgeInsets.symmetric(
                        vertical: screenUtil.setHeight(200),
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.chat_outlined,
                            color: kBlack,
                            size: 40,
                          ),
                          TextUtil.secondaryText(
                            text: "No message requests",
                            color: kBlack,
                            size: 20,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ));
  }
}
