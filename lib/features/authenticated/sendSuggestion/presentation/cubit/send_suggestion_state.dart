import 'package:ansaap_app/core/enums/auth_status.dart';
import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/cities_content_model.dart';
import 'package:ansaap_app/features/authenticated/viewFamilies/data/models/families_content_model.dart';
import 'package:ansaap_app/features/authentication/auth/data/models/user_content_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_suggestion_state.freezed.dart';

@freezed
class SendSuggestionState with _$SendSuggestionState {
  const factory SendSuggestionState({
    @Default('') String message,
    @Default(CallStatus.pure) CallStatus sendSuggestionsStatus,

  }) = _SendSuggestionState;

}
