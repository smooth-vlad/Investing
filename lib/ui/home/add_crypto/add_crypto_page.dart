import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/post_crypto/post_crypto_request.dart';
import 'package:expenses/data/remote/token_list/token.dart';
import 'package:expenses/ui/home/add_crypto/add_crypto_state.dart';
import 'package:expenses/ui/home/add_crypto/date_and_price_sync_component.dart';
import 'package:expenses/ui/home/add_crypto/token_list/token_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AddCryptoPage extends StatefulWidget {
  const AddCryptoPage({Key? key}) : super(key: key);

  @override
  State<AddCryptoPage> createState() => _AddCryptoPageState();
}

class _AddCryptoPageState extends State<AddCryptoPage> {
  @override
  Widget build(BuildContext context) {
    final Map<Operation, Widget> segments = {
      Operation.BUY: Text(
        'Покупка',
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
      Operation.SELL: Text(
        'Продажа',
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
    };

    return ChangeNotifierProvider(
      create: (context) => AddCryptoState(),
      child: Builder(builder: (context) {
        void postCrypto() {
          final state = context.read<AddCryptoState>();
          final token = state.selectedToken;
          final currency = state.selectedCurrency;
          final price = state.priceTextController.text;
          final quantity = state.quantityTextController.text;
          final date = state.selectedDate;
          final operationType = state.operationType;
          if (token != null &&
              currency != null &&
              price.isNotEmpty &&
              quantity.isNotEmpty) {
            final crypto = PostCryptoRequest(
              name: token.name,
              sysname: token.sysname,
              currency: currency.id,
              price: double.parse(price),
              amount: double.parse(quantity) *
                  (operationType == Operation.BUY ? 1 : -1),
              operationDate: date.millisecondsSinceEpoch ~/ 1000,
            );
            context
                .read<ExpensesClient>()
                .getCryptoService()
                .postCrypto(crypto)
                .whenComplete(() {
              Navigator.of(context).pop();
            });
          }
        }

        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text("Добавить криптовалюту"),
            previousPageTitle: "Активы",
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: CupertinoSlidingSegmentedControl<Operation>(
                            children: segments,
                            onValueChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  context
                                      .read<AddCryptoState>()
                                      .updateOperationType(value);
                                }
                              });
                            },
                            groupValue:
                                context.read<AddCryptoState>().operationType,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        DateAndPriceSyncComponent(),
                      ],
                    ),
                  ),
                  Spacer(),
                  CupertinoButton.filled(
                    child: Text("Добавить"),
                    onPressed: () {
                      postCrypto();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
