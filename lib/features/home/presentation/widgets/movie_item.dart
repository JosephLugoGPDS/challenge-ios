import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 8.h),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          margin: EdgeInsets.only(right: 8.w, left: 8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                  AppTheme.primaryColor, BlendMode.colorBurn),
            ),
          ),
          width: 150.w,
          height: 150.h,
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
