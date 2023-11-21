import 'package:challenge/app/presentation/env/env.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/home/presentation/bloc/bloc/get_movies_bloc.dart';
import 'package:challenge/features/home/presentation/widgets/image_user.dart';
import 'package:challenge/features/home/presentation/widgets/movie_item.dart';
import 'package:challenge/features/home/presentation/widgets/poster_widget.dart';
import 'package:challenge/features/home/presentation/widgets/welcome_user.dart';
import 'package:challenge/gen/assets.gen.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:challenge/injector_container.dart' as di;
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocProvider(
      create: (_) => di.sl<GetMoviesBloc>()
        ..add(FetchMovies(locale: l10n.locale, page: 1)),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController horizontalController = ScrollController();
    final AppLocalizations l10n = context.l10n;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppTheme.primaryColor,
              AppTheme.secondaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 30.sp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, size: 30.sp),
                ),
              ],
              title: Row(
                children: [
                  SizedBox(width: 12.w),
                  const ImageUser(),
                  SizedBox(width: 12.w),
                  const WelcomeUser(),
                ],
              ),
              floating: true,
              backgroundColor: Colors.transparent,
            ),
            BlocBuilder<GetMoviesBloc, GetMoviesState>(
              builder: (context, stateGetMoviesState) {
                if (stateGetMoviesState is GetMoviesLoading) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
                if (stateGetMoviesState is GetMoviesFailure) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100.h,
                      child: Center(
                        child: Text(stateGetMoviesState.message),
                      ),
                    ),
                  );
                }
                if (stateGetMoviesState is GetMoviesSuccess) {
                  return SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.only(top: 16.h),
                      height: 700.h,
                      width: 400.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PosterWidget(
                              imageUrl:
                                  '${Env.baseImage}${stateGetMoviesState.movies.last.posterPath}'),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0.w),
                            child: Text(
                              l10n.popularMovies,
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Expanded(
                            child: CustomScrollView(
                              controller: horizontalController,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              slivers: [
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      return MovieItem(
                                          imageUrl:
                                              '${Env.baseImage}${stateGetMoviesState.movies[index].posterPath}');
                                    },
                                    childCount:
                                        stateGetMoviesState.movies.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100.h,
                    child: Center(
                      child: SvgPicture.asset(Assets.svg.brand),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
