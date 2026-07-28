import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecase/login_use_case.dart';
import '../../infrastructure/driven_adapters/supabase/supabase_auth_adapter.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(const SupabaseAuthAdapter());
}
