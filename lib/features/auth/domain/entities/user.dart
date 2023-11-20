import 'package:equatable/equatable.dart';

abstract class User extends Equatable {
  const User({
    required this.name,
    required this.token,
    required this.apiKey,
  });

  final String name;
  final String token;
  final String apiKey;

  @override
  List<Object?> get props => [
        name,
        token,
        apiKey,
      ];
}
