import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/domian/state/coin_state.dart';
import 'package:meta_app/presentation/view_models/coin_controllers.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/home/end_drawer.dart';

import '../../../../domian/models/coin.dart';

class MarketPage extends ConsumerStatefulWidget {
  const MarketPage({super.key});

  @override
  ConsumerState<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends ConsumerState<MarketPage> {
  @override
  Widget build(BuildContext context) {
    // ref.read(coinControllerProvider.notifier).getCoins();
    // ref.read(coinListProvider);
    final coinAsync = ref.watch(futureCoinProvider);

    return AppScaffold(
      drawer: const AppEndDrawer(),
      body: coinAsync.when(
        data: (coinList) {
          return ListView.builder(
            itemBuilder: (context, index) => CoinTile(coins: coinList[index]),
            itemCount: 100,
          );
        },
        error: (error, _) {
          return Center(child: Text(error.toString()));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class CoinTile extends StatelessWidget {
  final Coin coins;
  const CoinTile({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.grey,
      height: 70,
      width: 100,
      child: ListTile(
        leading: Text(coins.name),
        title: Text(coins.symbol),
      ),
    );
  }
}
