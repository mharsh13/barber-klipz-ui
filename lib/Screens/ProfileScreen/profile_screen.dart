import 'package:barber_klipz_ui/Resources/image_const.dart';
import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Provider/profile_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
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
    final baseModel = ref.watch(profileBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
            text: "sm0602",
            color: kGold,
            size: 18,
            fontWeight: FontWeight.w600),
        centerTitle: true,
        leading: Row(
          children: [
            SizedBox(
              width: screenUtil.setWidth(5),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: kWhite,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(30),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.star_border_outlined,
                  color: kWhite,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: [
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.attach_money,
                color: kWhite,
              ),
              onPressed: () {},
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.settings),
              color: kWhite,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenUtil.setHeight(150),
            child: Stack(
              children: [
                SizedBox(
                  width: screenUtil.screenWidth,
                  height: screenUtil.setHeight(120),
                  child: Image.asset(
                    ImageConst.sampleImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.5,
                  left: 145,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    width: screenUtil.setHeight(80),
                    height: screenUtil.setHeight(80),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        ImageConst.appLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: screenUtil.setWidth(12)),
            child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(35)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    TextUtil.secondaryText(
                      text: "0",
                      color: kBlack,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    TextUtil.secondaryText(
                      text: "Posts",
                      color: kTextSubTitle,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Column(
                  children: [
                    TextUtil.secondaryText(
                      text: "0",
                      color: kBlack,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    TextUtil.secondaryText(
                      text: "Followers",
                      color: kTextSubTitle,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextUtil.secondaryText(
                      text: "0",
                      color: kBlack,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    TextUtil.secondaryText(
                      text: "Following",
                      color: kTextSubTitle,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextUtil.secondaryText(
                      text: "0",
                      color: kBlack,
                      size: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    TextUtil.secondaryText(
                      text: "Level",
                      color: kTextSubTitle,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(25),
          ),
          TabBar(
            onTap: (int value) {
              baseModel.setValue(value);
            },
            dividerColor: kGrey,
            padding: EdgeInsets.only(bottom: screenUtil.setHeight(1)),
            indicatorColor: kGold,
            controller: _tabController,
            tabs: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenUtil.setHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.grid_on,
                      color: kLicorice,
                    ),
                    SizedBox(
                      width: screenUtil.setWidth(5),
                    ),
                    TextUtil.secondaryText(
                      text: 'Post',
                      color: kLicorice,
                      size: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: screenUtil.setHeight(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.movie_creation_outlined,
                      color: kLicorice,
                    ),
                    SizedBox(
                      width: screenUtil.setWidth(5),
                    ),
                    TextUtil.secondaryText(
                      text: 'Flickz',
                      color: kLicorice,
                      size: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          baseModel.currentValue == 0
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenUtil.setHeight(20)),
                  child: Column(children: [
                    Icon(
                      Icons.video_collection_outlined,
                      color: kHintText,
                      size: screenUtil.setSp(80),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    TextUtil.secondaryText(
                      text: "Your content has values!",
                      color: kBlack,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    TextUtil.secondaryText(
                      text:
                          "Create your first piece of content\nand start making money.",
                      color: kBlack,
                      size: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    )
                  ]),
                )
              : Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: screenUtil.setHeight(20)),
                  child: Column(children: [
                    Icon(
                      Icons.video_collection_outlined,
                      color: kHintText,
                      size: screenUtil.setSp(80),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    TextUtil.secondaryText(
                      text: "Your content has values!",
                      color: kBlack,
                      size: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(10),
                    ),
                    TextUtil.secondaryText(
                      text:
                          "Create your first piece of content\nand start making money.",
                      color: kBlack,
                      size: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    )
                  ]),
                )
        ],
      ),
    );
  }
}
