import 'package:expenses/data/remote/token_list/token.dart';
import 'package:flutter/cupertino.dart';

import 'token_item.dart';

class TokenList extends StatelessWidget {
  const TokenList(this.items, {Key? key}) : super(key: key);

  final List<Token> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TokenItem(items[index]);
      },
      itemCount: items.length,
    );
  }
}
