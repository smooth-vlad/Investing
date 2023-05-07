import 'package:expenses/data/remote/currency/currency.dart';
import 'package:expenses/data/remote/token_list/token.dart';
import 'package:flutter/cupertino.dart';

import 'currency_item.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList(this.items, {Key? key, this.filter}) : super(key: key);

  final String? filter;

  final List<Currency> items;

  List<Currency> filterCurrencies() {
    return items
        .where((element) =>
            filter != null &&
                element.name?.toLowerCase().contains(filter!.toLowerCase()) ==
                    true ||
            element.sysname?.toLowerCase().contains(filter!.toLowerCase()) ==
                true)
        .toList();
  }

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    final items = widget.filterCurrencies();

    return ListView.builder(
      itemBuilder: (context, index) {
        return CurrencyItem(items[index]);
      },
      itemCount: items.length,
    );
  }
}
