import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../Resources/color_const.dart';

class NetImage extends StatelessWidget {
  final String? uri;
  final BoxFit? fit;
  final double? height;
  final double? width;
  const NetImage({super.key, this.uri, this.fit, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: uri ?? "",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit ?? BoxFit.cover,
          ),
        ),
      ),
      height: height,
      width: width,
      placeholder: (context, url) =>
          const BlurHash(hash: "L5H2EC=PM+yV0g-mq.wG9c010J}I"),
      errorWidget: (context, url, error) => Container(
        color: kWhite,
        child: const Icon(
          Icons.account_circle,
          color: kGold,
        ),
      ),
    );
  }
}
