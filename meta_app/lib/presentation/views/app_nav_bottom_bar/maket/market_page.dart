import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';
import 'package:meta_app/presentation/state/coin_state.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';
import 'package:meta_app/presentation/Resources/style_manager.dart';
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
    final state = ref.watch(coinControllerProvider);
    // ref.read(coinListProvider);
    // final coinAsync = ref.watch(futureCoinProvider);
    // state.getCoins(context);
    // return AppScaffold(
    //   drawer: const AppEndDrawer(),
    //   body: coinAsync.when(
    //     data: (coinList) {
    //       return ListView.builder(
    //         itemBuilder: (context, index) => CoinTile(coins: coinList[index]),
    //         itemCount: 100,
    //       );
    //     },
    //     error: (error, _) {
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Center(
    //             child: Text(
    //           error.toString(),
    //           style:
    //               getSemiBoldTextStyle(color: ColorManager.white, fontSize: 20),
    //         )),
    //       );
    //     },
    //     loading: () => const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ),
    // );

    // use coin controller
    return AppScaffold(
      body: Column(
        children: [
          if (state is CoinStateInital)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'No data yet',
                  style: getSemiBoldTextStyle(
                      color: ColorManager.white, fontSize: 20),
                ),
              ),
            ),
          if (state is CoinStateLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (state is CoinStateSuccess)
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    CoinTile(coins: state.coinList[index]),
                itemCount: 100,
              ),
            ),
        ],
      ),
      drawer: Container(),
    );
  }
}

class CoinTile extends StatelessWidget {
  final Coin coins;
  const CoinTile({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 70,
      width: 100,
      child: ListTile(
        leading: Text(coins.name),
        title: Text(coins.symbol),
      ),
    );
  }
}
