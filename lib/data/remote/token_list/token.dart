import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {

  final String symbol;
  final String sysname;
  final String name;
  final int? marketCapRank;
  final String? thumb;
  final String? large;

  Token({
    required this.symbol,
    required this.sysname,
    required this.name,
    required this.marketCapRank,
    required this.thumb,
    required this.large,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

}