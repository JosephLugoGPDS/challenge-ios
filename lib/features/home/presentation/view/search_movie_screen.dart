import 'package:challenge/app/presentation/env/env.dart';
import 'package:challenge/app/presentation/theme/app_theme.dart';
import 'package:challenge/app/presentation/widgets/card_container.dart';
import 'package:challenge/core/utils/extensions/screen_extension.dart';
import 'package:challenge/features/auth/presentation/widget/custom_text_form_field.dart';
import 'package:challenge/features/home/presentation/bloc/search/search_movies_bloc.dart';
import 'package:challenge/features/home/presentation/widgets/movie_item_search.dart';
import 'package:challenge/gen/assets.gen.dart';
import 'package:challenge/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:challenge/injector_container.dart' as di;
import 'package:flutter_svg/svg.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocProvider(
      create: (_) => di.sl<SearchMoviesBloc>()
        ..add(FetchSearchMovies(locale: l10n.locale, page: 1, query: '')),
      child: const SearchMovieView(),
    );
  }
}

class SearchMovieView extends StatelessWidget {
  const SearchMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    final TextEditingController searchController = TextEditingController();
    final ScrollController controllerScroll = ScrollController();
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: CustomScrollView(
        controller: controllerScroll,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.h + MediaQuery.of(context).padding.top,
                  left: 8.w,
                  right: 8.w),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    onPressed: () => Navigator.pop(context),
                    icon: Hero(
                      tag: 'back_icon',
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20.sp,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      color: AppTheme.barBackgroundColor,
                      padding: EdgeInsets.only(
                          top: 4.h, bottom: 7.h, left: 16.w, right: 16.w),
                      children: [
                        CustomTextFormField(
                          controller: searchController,
                          onChanged: (value) {},
                          hint: l10n.searchMovie,
                          textColor: AppTheme.whiteColor,
                          textInputAction: TextInputAction.done,
                          leading: IconButton(
                            onPressed: () {
                              debugPrint('search');
                              debugPrint(searchController.text);
                              if (searchController.text.isNotEmpty) {
                                context.read<SearchMoviesBloc>().add(
                                      FetchSearchMovies(
                                          locale: l10n.locale,
                                          page: 1,
                                          query: searchController.text),
                                    );
                              }
                            },
                            icon: Hero(
                              tag: 'search_icon',
                              child: Icon(
                                Icons.search,
                                size: 30.sp,
                                // color: AppTheme.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
            builder: (context, stateSearchMoviesState) {
              if (stateSearchMoviesState is SearchMoviesLoading) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
              if (stateSearchMoviesState is SearchMoviesFailure) {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    height: 100.h,
                    child: Center(
                      child: Text(
                        stateSearchMoviesState.message,
                        style: const TextStyle(color: AppTheme.whiteColor),
                      ),
                    ),
                  ),
                );
              }
              if (stateSearchMoviesState is SearchMoviesSuccess) {
                return SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 16.h),
                    height: 700.h,
                    width: 400.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0.w),
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
                            controller: controllerScroll,
                            physics: const AlwaysScrollableScrollPhysics(),
                            slivers: [
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return MovieItemSearch(
                                        title: stateSearchMoviesState
                                            .movies[index].title,
                                        voteAverage: stateSearchMoviesState
                                            .movies[index].voteAverage,
                                        overview: stateSearchMoviesState
                                            .movies[index].overview,
                                        releaseDate: stateSearchMoviesState
                                            .movies[index].releaseDate,
                                        imageUrl:
                                            '${Env.baseImage}${stateSearchMoviesState.movies[index].posterPath}');
                                  },
                                  childCount:
                                      stateSearchMoviesState.movies.length,
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
    );
  }
}
