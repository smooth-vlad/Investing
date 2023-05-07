import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable()
class Currency {
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final String? sysname;
  final String? symbol;

  Currency({
    required this.id,
    required this.name,
    required this.sysname,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
