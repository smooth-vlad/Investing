import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_price_response.g.dart';

@JsonSerializable()
class GetCryptoPriceResponse {
  @JsonKey(name: 'crypto')
  final double price;

  GetCryptoPriceResponse({
    required this.price,
  });

  factory GetCryptoPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoPriceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoPriceResponseToJson(this);
}