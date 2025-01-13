import 'package:ansaap_app/core/enums/auth_status.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String message,
    UserContentModel? userEntity,
    @Default(AuthStatus.unAuthenticated) AuthStatus authState,
    @Default(CallStatus.pure) CallStatus signInStatus,
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _AuthState;
}
