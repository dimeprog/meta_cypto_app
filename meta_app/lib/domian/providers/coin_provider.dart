import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/app/app_constant.dart';
import 'package:meta_app/data/repository/app_repository.dart';
import 'package:meta_app/data/services/api.dart';

// coin repo
final coinRepoProvider =
    Provider<CoinRepository>((ref) => CoinRepository(Api()));
