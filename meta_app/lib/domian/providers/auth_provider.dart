import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta_app/data/repository/firebase_auth_repository.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(FirebaseAuth.instance));

final authStateChangeProvider = StreamProvider<User?>(
    (ref) => ref.read(authRepositoryProvider).authChanges());
