import 'package:json_annotation/json_annotation.dart';

part 'get_crypto_price_request.g.dart';

@JsonSerializable()
class GetCryptoPriceRequest {
  final int operationDate;
  @JsonKey(name: 'sysname')
  final String tokenId;
  @JsonKey(name: 'currency')
  final String currencyId;

  GetCryptoPriceRequest({
    required this.operationDate,
    required this.tokenId,
    required this.currencyId,
  });

  factory GetCryptoPriceRequest.fromJson(Map<String, dynamic> json) =>
      _$GetCryptoPriceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetCryptoPriceRequestToJson(this);
}
