import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/app_constant.dart';
import 'package:meta_app/domian/providers/coin_provider.dart';
import 'package:meta_app/domian/state/coin_state.dart';

import '../../domian/models/coin.dart';

class CoinController extends StateNotifier<CoinState> {
  final Ref ref;
  CoinController(this.ref) : super(const CoinStateInital());

  void getCoins() async {
    state = const CoinStateLoading();
    try {
      await ref.read(coinRepoProvider).getCoins().then((value) {
        state = CoinStateSuccess(value);
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
final coinListProvider = Provider((ref) {
  return CoinController(ref).getCoins();
});
