import 'package:json_annotation/json_annotation.dart';

part 'crypto_type.g.dart';

@JsonSerializable()
class CryptoType {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String sysname;
  final DateTime createdAt;
  final DateTime updatedAt;

  CryptoType({
    required this.id,
    required this.name,
    required this.sysname,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CryptoType.fromJson(Map<String, dynamic> json) => _$CryptoTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoTypeToJson(this);
}
