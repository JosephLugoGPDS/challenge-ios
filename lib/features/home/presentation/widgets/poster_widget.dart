import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/app/presentation/widgets/theme_button_gradient.dart.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              margin: EdgeInsets.only(left: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      AppTheme.primaryColor, BlendMode.colorBurn),
                ),
              ),
              width: 400.w,
              height: 400.h,
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: ThemeButtonGradient(
                title: l10n.play,
                onPressed: null,
                colors: const [AppTheme.whiteColor, AppTheme.whiteColor],
                leading: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: AppTheme.accentColor,
                      size: 30.sp,
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
