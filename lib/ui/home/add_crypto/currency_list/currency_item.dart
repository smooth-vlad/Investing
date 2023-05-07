import 'package:expenses/data/remote/currency/currency.dart';
import 'package:expenses/ui/home/add_crypto/add_crypto_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem(this.item, {Key? key}) : super(key: key);

  final Currency item;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(item.symbol ?? ""),
      subtitle: Text(item.name ?? ""),
      onTap: () {
        Navigator.of(context).pop<Currency>(item);
      },
    );
  }
}
