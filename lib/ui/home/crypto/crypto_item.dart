import 'package:expenses/data/remote/crypto/crypto.dart';
import 'package:expenses/data/remote/crypto/delete/delete_crypto_request.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/ui/home/add_crypto/add_crypto_state.dart';
import 'package:expenses/ui/price_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CryptoItem extends StatelessWidget {
  const CryptoItem(this.item, {Key? key, this.onDelete}) : super(key: key);

  final Crypto item;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: item.allTimePercent > 0
          ? CupertinoColors.systemGreen
          : CupertinoColors.systemRed,
    );

    return CupertinoContextMenu(
      previewBuilder: (context, animation, child) {
        return Container(
          width: 192,
          height: 192,
          decoration: BoxDecoration(
            color: CupertinoTheme.of(context).barBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: item.crypto?.large != null
                      ? Image.network(item.crypto!.large!)
                      : Container(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.name,
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 24,
                    ),
              ),
            ],
          ),
        );
      },
      actions: [
        CupertinoContextMenuAction(
          isDestructiveAction: true,
          onPressed: () {
            context
                .read<ExpensesClient>()
                .getCryptoService()
                .deleteCrypto(DeleteCryptoRequest(id: item.id))
                .whenComplete(() => onDelete?.call());
            Navigator.of(context, rootNavigator: true).pop();
          },
          trailingIcon: CupertinoIcons.delete,
          child: const Text('Удалить'),
        ),
      ],
      child: Container(
        color: CupertinoTheme.of(context).barBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: item.crypto?.large != null
                      ? Image.network(item.crypto!.large!)
                      : Container(),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      item.name,
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                    SizedBox(height: 4),
                    Text(
                      item.amount.toStringAsFixed(6),
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text(
                    "${PriceFormatter.formatPrice(item.price, nonZeroDigits: 4)} ${item.currency.symbol}",
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "${(item.allTimePercent).toStringAsFixed(2)}%",
                        style: textStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          '•',
                          style: textStyle,
                        ),
                      ),
                      Text(
                        "${(PriceFormatter.formatPrice(item.allTime, nonZeroDigits: 4))} ${item.currency.symbol}",
                        style: textStyle,
                      ),
                    ],
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

String getSign(num value) {
  if (value > 0) {
    return '+';
  } else if (value < 0) {
    return '-';
  } else {
    return '';
  }
}
