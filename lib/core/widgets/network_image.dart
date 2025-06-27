import 'package:my_flutter_template/core/api/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_network/image_network.dart';
import 'package:my_flutter_template/core/di/injection.dart' as di;

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
    final bool isMock = di.getIt<di.AppSettings>().environment.isMock;
    final String fullImageUrl = '${isMock ? '' : '${EndPoints.baseUrl}/'}$imageUrl';

    return ImageNetwork(
        onTap: onTap,
        image: fullImageUrl,
        height: height.r,
        width: height.r,
        fitAndroidIos: BoxFit.cover,
        onError: Icon(onErrorIcon)
        );
  }
}
