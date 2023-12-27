import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utility/colors.dart';

class AppNetworkImage extends StatelessWidget {
  final String src;
  final BoxFit fit;
  final double height;
  final double width;
  const AppNetworkImage({Key? key, required this.src, this.fit = BoxFit.cover, this.height = double.infinity,  this.width = double.infinity } ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: src,
      fit: fit,
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(color: Colors.grey.shade200,)
          ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}