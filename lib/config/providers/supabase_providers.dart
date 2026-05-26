import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../infrastructure/driven_adapters/supabase/supabase_match_adapter.dart';
import '../../../domain/models/gateways/match_gateway.dart';

part 'supabase_providers.g.dart';

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(Ref ref) {
  return Supabase.instance.client;
}

@Riverpod(keepAlive: true)
MatchGateway matchGateway(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseMatchAdapter(client);
}
