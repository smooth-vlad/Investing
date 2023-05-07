import 'package:flutter/cupertino.dart';

import '../../../data/remote/crypto/crypto.dart';
import 'crypto_item.dart';

class CryptoList extends StatelessWidget {
  const CryptoList(this.items, {Key? key, this.onRefresh}) : super(key: key);

  final List<Crypto> items;
  final Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      if (onRefresh != null) ...[
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            onRefresh!.call();
          },
        )
      ],
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CryptoItem(
              items[index],
              onDelete: () {
                onRefresh?.call();
              },
            );
          },
          childCount: items.length,
        ),
      ),
    ]);
  }
}
