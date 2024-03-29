import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:meta_app/domian/providers/coin_provider.dart';
import 'package:meta_app/presentation/state/coin_state.dart';

import '../../domian/models/coin.dart';

class CoinController extends StateNotifier<CoinState> {
  final Ref ref;
  CoinController(this.ref) : super(CoinStateInital()) {
    getCoins();
  }

  void getCoins() async {
    state = const CoinStateLoading();
    try {
      await ref.read(coinRepoProvider).getCoins().then((value) {
        // print('This is $value');
        state = CoinStateSuccess(value);
        print('helo');
      }).catchError((e) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(
        //       e.toString(),
        //     ),
        //   ),
        // );
      });
    } catch (err) {
      state = CoinStateError(err.toString());
    }
  }
}

final coinControllerProvider = StateNotifierProvider<CoinController, CoinState>(
  (ref) => CoinController(ref),
);

// future providers  are use fast developmet
final futureCoinProvider = FutureProvider.autoDispose<List<Coin>>((ref) async {
  return await ref.read(coinRepoProvider).getCoins();
});
