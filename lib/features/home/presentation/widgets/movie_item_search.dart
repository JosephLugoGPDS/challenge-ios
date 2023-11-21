import 'package:cached_network_image/cached_network_image.dart';
import 'package:challenge/app/presentation/routes/app_router.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieItemSearch extends StatelessWidget {
  const MovieItemSearch({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
  });
  final String imageUrl;
  final double voteAverage;
  final String releaseDate;
  final String overview;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 8.h, left: 16.w),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRoutes.detailMovieScreen,
            arguments: <String, dynamic>{
              'imageUrl': imageUrl,
              'title': title,
              'voteAverage': voteAverage,
              'releaseDate': releaseDate,
              'overview': overview,
            }),
        child: Row(
          children: [
            CachedNetworkImage(
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
                width: 200.w,
                height: 120.h,
              ),
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              ),
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => SizedBox(
                width: 200.w,
                height: 120.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.h),
                    const Icon(Icons.error),
                    SizedBox(height: 8.h),
                    Expanded(child: SvgPicture.asset(Assets.svg.brand)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
