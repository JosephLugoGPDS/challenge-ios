import 'package:challenge/app/presentation/env/env.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/home/presentation/widgets/poster_widget.dart';
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
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
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            backgroundColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 16.h),
              height: 700.h,
              width: 400.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'poster',
                    child: PosterWidget(imageUrl: '${Env.baseImage}$imageUrl'),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 24.w, right: 16.0.w, top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < (voteAverage ~/ 2)
                                  ? Icons.star
                                  : Icons.star_border,
                              color: AppTheme.primaryColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        Text(
                          releaseDate,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 16.0.w),
                    child: Text(
                      overview,
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
