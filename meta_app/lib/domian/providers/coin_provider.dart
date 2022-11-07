import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/data/repository/coin_repository.dart';
import 'package:meta_app/data/services/api.dart';

// coin repo
final coinRepoProvider =
    Provider<CoinRepository>((ref) => CoinRepository(Api()));
