import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class ImageUser extends StatelessWidget {
  const ImageUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h, top: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: CachedNetworkImage(
        imageUrl:
            'https://image.tmdb.org/t/p/w500/fm6KqXpk3M2HVveHwCrBSSBaO0V.jpg',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                    AppTheme.primaryColor, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: 50.w,
        height: 50.w,
      ),
    );
  }
}
