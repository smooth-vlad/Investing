import 'package:json_annotation/json_annotation.dart';

part 'delete_crypto_request.g.dart';

@JsonSerializable()
class DeleteCryptoRequest {
  @JsonKey(name: '_id')
  final String id;

  DeleteCryptoRequest({required this.id});

  factory DeleteCryptoRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteCryptoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCryptoRequestToJson(this);
}
