import 'package:task_list_app/helpers/jwt_parser.dart';

class TokenData {
  String token;
  DateTime expiration;

  TokenData({this.token, this.expiration});

  factory TokenData.fromJson(json) => _tokenDataFromJson(json);

  Map<String, dynamic> toJson() => _tokenDataToJson(this);
}

TokenData _tokenDataFromJson(Map<String, dynamic> json) {
  return TokenData(
    token: json['token'] as String,
    expiration: json['token'] == null
        ? null
        : JwtParser().getExpirationTimeFromJwt(json['token'] as String),
  );
}

Map<String, dynamic> _tokenDataToJson(TokenData instance) => <String, dynamic>{
      'token': instance.token,
    };
