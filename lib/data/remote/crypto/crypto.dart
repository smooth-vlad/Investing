import 'package:expenses/data/remote/token_list/token.dart';
import 'package:json_annotation/json_annotation.dart';

import 'crypto_type.dart';
import '../currency/currency.dart';

part 'crypto.g.dart';

@JsonSerializable()
class Crypto {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String sysname;
  final double price;
  final double pricePerItem;
  final num amount;
  final CryptoType type;
  final Currency currency;
  final Token? crypto;
  final String userProfileId;
  final double allTime;
  final double allTimePercent;
  final double currentPrice;
  final double priceIntraday;

  Crypto({
    required this.id,
    required this.name,
    required this.sysname,
    required this.price,
    required this.pricePerItem,
    required this.amount,
    required this.type,
    required this.currency,
    required this.crypto,
    required this.userProfileId,
    required this.allTime,
    required this.allTimePercent,
    required this.currentPrice,
    required this.priceIntraday,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) => _$CryptoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoToJson(this);
}
