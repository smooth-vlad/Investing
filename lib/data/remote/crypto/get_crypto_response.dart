import 'package:json_annotation/json_annotation.dart';
import 'crypto.dart';

part 'get_crypto_response.g.dart';

@JsonSerializable()
class GetCryptoResponse {
  final List<Crypto> crypto;

  GetCryptoResponse({required this.crypto});

  factory GetCryptoResponse.fromJson(Map<String, dynamic> json) {
    return _$GetCryptoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCryptoResponseToJson(this);
}
