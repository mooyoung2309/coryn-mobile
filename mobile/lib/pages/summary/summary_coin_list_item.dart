import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/pages/detail/detail_page.dart';
import 'package:mobile/pages/components/coin/coin_image_box.dart';
import 'package:mobile/pages/components/coin/coin_price_rate_box.dart';
import 'package:mobile/pages/components/coin/coin_information_summary_box.dart';
import 'package:mobile/pages/components/icon_forward.dart';
import 'package:mobile/models/summary.dart';

class SummaryCoinListItem extends StatelessWidget {
  final Summary summary;

  const SummaryCoinListItem({Key? key, required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailPage(market: summary.coin.market, defaultOption: 0)),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CoinImageBox(summary.coin.logoUri),
          const SizedBox(width: 8),
          Expanded(
              child: CoinInformationSummaryBox(
            coinKoreanName: summary.coin.koreanName,
            coinMarket: summary.coin.market,
            priceCurrency: summary.price.currency,
            priceOpeningPrice: summary.price.openingPrice,
          )),
          const SizedBox(width: 15),
          Row(
            children: [
              CoinPriceRateBox(changeRate: summary.price.changeRate),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconForward(key: key),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
