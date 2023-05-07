import 'package:chopper/chopper.dart';
import 'package:expenses/data/remote/exchange/get_crypto_price_request.dart';
import 'package:expenses/data/remote/exchange/get_crypto_price_response.dart';
import 'package:expenses/data/remote/expenses_client.dart';
import 'package:expenses/data/remote/token_list/token.dart';
import 'package:expenses/ui/home/add_crypto/add_crypto_state.dart';
import 'package:expenses/ui/home/add_crypto/currency_list/currency_list_page.dart';
import 'package:expenses/ui/price_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import 'token_list/token_list_page.dart';

class DateAndPriceSyncComponent extends StatefulWidget {
  const DateAndPriceSyncComponent({Key? key}) : super(key: key);

  @override
  State<DateAndPriceSyncComponent> createState() =>
      _DateAndPriceSyncComponentState();
}

class _DateAndPriceSyncComponentState extends State<DateAndPriceSyncComponent> {
  double _cost = 0.0;

  void _showDatePicker(BuildContext context, CupertinoDatePickerMode mode) {
    final state = context.read<AddCryptoState>();

    DateTime tempDate = state.selectedDate;

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoActionSheet(
          actions: [
            SizedBox(
              height: MediaQuery.of(context).copyWith().size.height / 4,
              child: CupertinoDatePicker(
                mode: mode,
                initialDateTime: state.selectedDate,
                onDateTimeChanged: (DateTime newDate) {
                  tempDate = newDate;
                },
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Готово'),
            onPressed: () {
              state.updateSelectedDate(tempDate);
              _fetchCryptoPrice();
              Navigator.pop(builder);
            },
          ),
        );
      },
    );
  }

  String formatDate(date) {
    final DateFormat formatter = DateFormat('d MMMM y');
    return formatter.format(date);
  }

  String formatTime(date) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  void _fetchCryptoPrice() {
    final state = context.read<AddCryptoState>();

    if (state.selectedDate.isAfter(DateTime.now()) ||
        state.selectedCurrency == null ||
        state.selectedToken == null) {
      return;
    }

    _priceRequest = context
        .read<ExpensesClient>()
        .getCryptoService()
        .getCryptoPriceByDate(GetCryptoPriceRequest(
            operationDate: state.selectedDate.millisecondsSinceEpoch ~/ 1000,
            tokenId: state.selectedToken!.sysname,
            currencyId: state.selectedCurrency!.id))
        .then((value) {
      if (value.body?.price != null) {
        String newValue = value.body!.price.toString();
        state.priceTextController.value = TextEditingValue(
          text: newValue,
          selection: TextSelection.fromPosition(
            TextPosition(offset: newValue.length),
          ),
        );
      }
      return value;
    });
  }

  Future<Response<GetCryptoPriceResponse>>? _priceRequest;

  @override
  void initState() {
    _fetchCryptoPrice();
    super.initState();
  }

  @override
  void dispose() {
    final state = context.read<AddCryptoState>();
    state.priceTextController.dispose();
    state.quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Токен",
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(
              width: 24,
            ),
            Flexible(
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context)
                      .push<Token>(
                    CupertinoPageRoute(
                      builder: (context) => const TokenListPage(),
                    ),
                  )
                      .then((token) {
                    if (token != null) {
                      context.read<AddCryptoState>().updateSelectedToken(token);
                      _fetchCryptoPrice();
                    }
                  });
                },
                child: Consumer<AddCryptoState>(
                  builder: (context, value, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (value.selectedToken != null) ...[
                          SizedBox(
                            child: Image.network(value.selectedToken!.large!),
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8.0)
                        ],
                        Flexible(
                          child: Text(
                            value.selectedToken?.name ??
                                "Выберите криптовалюту",
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(CupertinoIcons.forward, size: 16.0),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Дата",
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            SizedBox(
              width: 24,
            ),
            CupertinoButton(
              child: Text(
                formatDate(context.watch<AddCryptoState>().selectedDate),
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
              onPressed: () {
                _showDatePicker(context, CupertinoDatePickerMode.date);
              },
              color: CupertinoColors.systemGrey6,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minSize: 0,
            ),
            SizedBox(
              width: 8,
            ),
            CupertinoButton(
              child: Text(
                formatTime(context.watch<AddCryptoState>().selectedDate),
                style: CupertinoTheme.of(context).textTheme.textStyle,
              ),
              onPressed: () {
                _showDatePicker(context, CupertinoDatePickerMode.time);
              },
              color: CupertinoColors.systemGrey6,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minSize: 0,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Цена",
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FutureBuilder(
                future: _priceRequest,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CupertinoActivityIndicator();
                  } else {
                    return CupertinoTextField(
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: false,
                        decimal: true,
                      ),
                      controller:
                          context.read<AddCryptoState>().priceTextController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d*'),
                        ),
                      ],
                      onChanged: (value) {
                        final quantity = double.tryParse(context
                                .read<AddCryptoState>()
                                .quantityTextController
                                .text) ??
                            0;
                        final price = double.tryParse(value) ?? 0;
                        setState(() {
                          _cost = quantity * price;
                        });
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
              height: 32,
              child: CupertinoButton(
                child: Text(
                  context.watch<AddCryptoState>().selectedCurrency?.symbol ??
                      "Валюта",
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) {
                        return CurrencyListPage();
                      },
                    ),
                  ).then((selectedCurrency) {
                    context
                        .read<AddCryptoState>()
                        .updateSelectedCurrency(selectedCurrency);
                    _fetchCryptoPrice();
                  });
                },
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                minSize: 0,
                color: CupertinoColors.systemGrey6,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Text(
              "Кол-во",
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: CupertinoTextField(
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                controller:
                    context.read<AddCryptoState>().quantityTextController,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d*'),
                  ),
                ],
                onChanged: (value) {
                  final price = double.tryParse(context
                          .read<AddCryptoState>()
                          .priceTextController
                          .text) ??
                      0;
                  final quantity = double.tryParse(value) ?? 0;
                  setState(() {
                    _cost = quantity * price;
                  });
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Сумма",
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            const SizedBox(
              width: 16,
            ),
            Consumer<AddCryptoState>(
              builder: (context, value, child) {
                return Text(
                  "${PriceFormatter.formatPrice(_cost, nonZeroDigits: 4)} ${value.selectedCurrency?.symbol ?? ""}",
                  style:
                      CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                );
              },
            )
          ],
        )
      ],
    );
  }
}
