import 'package:expenses/data/remote/currency/currency.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_currency_list_response.g.dart';

@JsonSerializable()
class GetCurrencyListResponse {

  @JsonKey(name: 'currency')
  final List<Currency>? currencies;

  GetCurrencyListResponse({
    required this.currencies,
  });

  factory GetCurrencyListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrencyListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrencyListResponseToJson(this);

}