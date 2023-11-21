import 'package:challenge/app/data/datasources/api_client.dart';
import 'package:challenge/app/data/models/success_response_model.dart';
import 'package:challenge/features/home/data/model/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<SuccessResponseModel> getMoviesFromNetwork(String locale, int page);
  Future<SuccessResponseModel> getSearchMovies(
      String locale, int page, String query);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  MoviesRemoteDataSourceImpl({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<SuccessResponseModel> getMoviesFromNetwork(
      String locale, int page) async {
    try {
      final response = await apiClient.dio.get(
        '/movie/upcoming',
        queryParameters: {
          'language': locale,
          'page': page,
        },
      );
      if (response.statusCode != 200) {
        return const SuccessResponseModel(
            success: false, message: "Get movies failed");
      } else {
        final movies = MovieModel.fromResult(response.data['results']);
        return SuccessResponseModel(
            success: true, message: 'Movies Success', responseObj: movies);
      }
    } catch (e) {
      return const SuccessResponseModel(
          success: false, message: "Get movies failed");
    }
  }

  @override
  Future<SuccessResponseModel> getSearchMovies(
      String locale, int page, String query) async {
    try {
      final response = await apiClient.dio.get(
        '/search/movie',
        queryParameters: {
          'language': locale,
          'page': page,
          'query': query,
        },
      );
      if (response.statusCode != 200) {
        return const SuccessResponseModel(
            success: false, message: "Get movies failed");
      } else {
        final movies = MovieModel.fromResult(response.data['results']);
        return SuccessResponseModel(
            success: true, message: 'Movies Success', responseObj: movies);
      }
    } catch (e) {
      return const SuccessResponseModel(
          success: false, message: "Get movies failed");
    }
  }
}
