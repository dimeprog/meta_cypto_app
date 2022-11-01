import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/widgets/app_scaffold.dart';

class MarketPage extends StatefulHookConsumerWidget {
  const MarketPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarketPageState();
}

class _MarketPageState extends ConsumerState<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      drawer: Container(),
      body: Column(
        children: [Text('Market')],
      ),
    );
  }
}
