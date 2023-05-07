// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoType _$CryptoTypeFromJson(Map<String, dynamic> json) => CryptoType(
      id: json['_id'] as String,
      name: json['name'] as String,
      sysname: json['sysname'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CryptoTypeToJson(CryptoType instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'sysname': instance.sysname,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
