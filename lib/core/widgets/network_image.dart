import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 50,
    this.onTap,
     required this.onErrorIcon,
  });

  final String imageUrl;
  final IconData onErrorIcon;
  final Function? onTap;

  final double height;

  @override
  Widget build(BuildContext context) {
    return  ImageNetwork(
          onTap: onTap,
            image: imageUrl, // Replace with actual URL property name
            height: height.r,
            width: height.r,
            fitAndroidIos: BoxFit.cover,
            onError:  Icon(
                onErrorIcon) // Placeholder for failed image loading
            );
  }
}
