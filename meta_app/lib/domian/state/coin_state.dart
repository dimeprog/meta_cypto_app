import 'package:equatable/equatable.dart';

import '../models/coin.dart';

class CoinState extends Equatable {
  const CoinState();
  @override
  List<Object?> get props => [];
}

class CoinStateSuccess extends CoinState {
  final List<Coin> coinList;
  const CoinStateSuccess(this.coinList);
  @override
  List<Object?> get props => [];
}

class CoinStateInital extends CoinState {
  const CoinStateInital();
  @override
  List<Object?> get props => [];
}

class CoinStateLoading extends CoinState {
  const CoinStateLoading();
  @override
  List<Object?> get props => [];
}

class CoinStateError extends CoinState {
  final String errorMessage;
  const CoinStateError(this.errorMessage);
  @override
  List<Object?> get props => [];
}
