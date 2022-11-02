import 'dart:io';

import 'package:meta_app/app/widgets/app_exception.dart';

import '../../domian/models/coin.dart';
import '../services/api.dart';

class CoinRepository {
  final Api api;
  CoinRepository(this.api);

  Future<List<Coin>> getCoins() async {
    try {
      final response = await api.getData('/coins/list?include_platform=false');
      final List<Coin> coinList =
          (response as List).map((e) => Coin.fromJson(e)).toList();
      return coinList;
    } on SocketException catch (err) {
      throw AppException(message: 'No internet connection');
    } catch (err) {
      throw AppException(message: err.toString());
    }
  }
}
