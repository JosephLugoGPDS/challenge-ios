
import 'package:challenge/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String name,
    required String token,
    required String apiKey,
  }) : super(name: name, token: token, apiKey: apiKey);

  @override
  List<Object?> get props => [
        name,
        token,
        apiKey,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
