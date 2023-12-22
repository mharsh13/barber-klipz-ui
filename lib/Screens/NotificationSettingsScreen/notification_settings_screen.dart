import 'package:barber_klipz_ui/Screens/NotificationSettingsScreen/Backend/Provider/notification_settings_base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class NotificationSettingsScreen extends ConsumerStatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  ConsumerState<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends ConsumerState<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(notificationSettingsBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Notification Settings",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: const BackButton(
          color: kWhite,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Comments",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.comments,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableComments(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Like",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.like,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableLikes(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Loves",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.loves,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableLoves(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Lives",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.lives,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableLives(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Direct messages",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.directMessages,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableDirectMessages(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Followers",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.followers,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableFollowers(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Subscribers",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.subscribers,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableSubscribers(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Barber Klipz Audio/Video",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.audioVideo,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableAudiVideo(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenUtil.setWidth(12),
              right: screenUtil.setWidth(12),
              top: screenUtil.setHeight(10),
            ),
            child: Row(
              children: [
                TextUtil.secondaryText(
                  text: "Barber Klipz Audio Camps",
                  color: kBlack,
                  size: 14,
                ),
                const Spacer(),
                SizedBox(
                  width: 55,
                  height: 35,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      value: baseModel.camps,
                      activeColor: kYellow,
                      trackColor: kGrey,
                      thumbColor: kWhite,
                      onChanged: (value) {
                        baseModel.enableAudioCamps(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kGrey,
          )
        ],
      ),
    );
  }
}
