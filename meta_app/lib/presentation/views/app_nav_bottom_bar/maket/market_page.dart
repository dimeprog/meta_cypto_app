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
    // ref.watch(coinListProvider);
    final state = ref.watch(coinControllerProvider.notifier).state;

    return AppScaffold(
      drawer: const AppEndDrawer(),
      body: Column(
        children: [
          if (state is CoinStateInital)
            const Center(
              child: Text('No data yet'),
            ),
          if (state is CoinStateLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (state is CoinStateError)
            Center(
              child: Text(state.errorMessage),
            ),
          if (state is CoinStateSuccess)
            ListView.builder(
              itemBuilder: (context, index) =>
                  CoinTile(coins: state.coinList[index]),
              itemCount: 100,
            ),
        ],
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
