import 'package:mobile/models/dto/coin.dart';
import 'package:mobile/models/dto/news.dart';

class CalendarModal {
  final Coin coin;
  final List<News> newsList;

  CalendarModal({
    required this.coin,
    required this.newsList,
  });
}
