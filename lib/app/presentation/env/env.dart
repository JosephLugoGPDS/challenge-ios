import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static final String user = dotenv.get('USER', fallback: 'exception dotenv: USER');
  static final String password = dotenv.get('PASSWORD', fallback: 'exception dotenv: PASSWORD');
  static final String uri = 'https://${dotenv.get('URI', fallback: 'exception dotenv: URI')}';
  static final String accessToken = dotenv.get('ACCESS_TOKEN', fallback: 'exception dotenv: ACCESS_TOKEN');
  static final String apiKey = dotenv.get('API_KEY', fallback: 'exception dotenv: API_KEY');
  static final String baseImage = 'https://${dotenv.get('BASE_IMAGE', fallback: 'exception dotenv: BASE_IMAGE')}';
}