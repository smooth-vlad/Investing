import 'package:expenses/ui/home/add_crypto/add_crypto_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../data/remote/token_list/token.dart';

class TokenItem extends StatelessWidget {
  const TokenItem(this.item, {Key? key}) : super(key: key);

  final Token item;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      leading: item.large != null ? Image.network(item.large!) : null,
      title: Text(item.name),
      subtitle: Text(item.symbol.toUpperCase()),
      onTap: () {
        Navigator.of(context).pop<Token>(item);
      },
    );
  }
}
