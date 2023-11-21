import 'package:challenge/features/auth/presentation/view/login_screen.dart';
import 'package:challenge/features/auth/presentation/view/splash_screen.dart';
import 'package:challenge/features/home/presentation/view/home_screen.dart';
import 'package:challenge/features/home/presentation/view/movie_detail_screen.dart';
import 'package:challenge/features/home/presentation/view/search_movie_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String loginScreen = '/login';
  static const String searchMoviesScreen = '/search';
  static const String detailMovieScreen = '/detail_movie';

  static Map<String, WidgetBuilder> get routes {
    return {
      splashScreen: (BuildContext context) => const SplashScreen(),
      homeScreen: (BuildContext context) => const HomeScreen(),
      loginScreen: (BuildContext context) => const LoginScreen(),
      searchMoviesScreen: (BuildContext context) => const SearchMovieScreen(),
      detailMovieScreen: (BuildContext context) => MovieDetailScreen(
            imageUrl: ((ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)['imageUrl'] as String),
            title: (ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)['title'] as String,
            voteAverage: (ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)['voteAverage'] as double,
            releaseDate: (ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)['releaseDate'] as String,
            overview: (ModalRoute.of(context)!.settings.arguments
                as Map<String, dynamic>)['overview'] as String,
          ),
    };
  }
}
