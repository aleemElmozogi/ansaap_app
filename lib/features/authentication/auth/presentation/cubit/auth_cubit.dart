import 'package:ansaap_app/core/enums/auth_status.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/localStorage/loacal_storage.dart';
import 'package:ansaap_app/core/requests/login_request.dart';

import 'package:ansaap_app/features/authentication/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase _authUsecase;
  final LocalStorage _localStorage;

  AuthCubit(this._authUsecase, this._localStorage) : super(AuthState());

  Future<void> logOut() async {
    emit(state.copyWith(
      authState: AuthStatus.unAuthenticated,
    ));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(userEntity: null));
  }

  void swishAppThemeMode() {
    emit(state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light));
  }

  Future<void> onForceLogout() async {
    emit(state.copyWith(
      authState: AuthStatus.unAuthenticated,
    ));
    await _localStorage.refreshAccessToken('');
    emit(state.copyWith(
      userEntity: null,
    ));
  }

  Future<void> login(String phone, String password) async {
    emit(state.copyWith(signInStatus: CallStatus.inProgress));
    final response =
        await _authUsecase(LoginRequest(password: password, phone: phone));
    response.fold(
        (failure) => emit(state.copyWith(
            signInStatus: CallStatus.failed,
            authState: AuthStatus.unAuthenticated,
            message: failure.message.toString())),
        (userContent) => emit(state.copyWith(
            userEntity: userContent,
            signInStatus: CallStatus.success,
            authState: AuthStatus.authenticated)));
  }
}
