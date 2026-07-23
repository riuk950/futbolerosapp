import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecase/get_matches_use_case.dart';
import 'supabase_providers.dart';

part 'use_case_providers.g.dart';

@Riverpod(keepAlive: true)
GetMatchesUseCase getMatchesUseCase(Ref ref) {
  final gateway = ref.watch(matchGatewayProvider);
  return GetMatchesUseCase(gateway);
}
