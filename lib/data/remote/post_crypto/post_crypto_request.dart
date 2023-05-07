import 'package:json_annotation/json_annotation.dart';

part 'post_crypto_request.g.dart';

@JsonSerializable()
class PostCryptoRequest {
  final String name;
  final String sysname;
  final double amount;
  final String currency;
  final int operationDate;
  final double price;

  PostCryptoRequest({
    required this.name,
    required this.sysname,
    required this.amount,
    required this.currency,
    required this.operationDate,
    required this.price,
  });

  factory PostCryptoRequest.fromJson(Map<String, dynamic> json) =>
      _$PostCryptoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PostCryptoRequestToJson(this);
}
