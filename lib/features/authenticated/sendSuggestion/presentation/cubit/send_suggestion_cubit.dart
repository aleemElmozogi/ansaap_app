import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/usecases/usecase.dart';
import 'package:ansaap_app/features/authenticated/sendSuggestion/domain/usecases/send_suggestion_usecase.dart';
import 'package:ansaap_app/features/authenticated/sendSuggestion/presentation/cubit/send_suggestion_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SendSuggestionCubit extends Cubit<SendSuggestionState> {
  final SendSuggestionUsecase _sendSuggestionUsecase;

  SendSuggestionCubit(this._sendSuggestionUsecase)
      : super(SendSuggestionState());

  Future<void> sendSuggestion(String suggestion) async {
    emit(state.copyWith(sendSuggestionsStatus: CallStatus.inProgress));
    final response = await _sendSuggestionUsecase(suggestion);
    response.fold(
        (failure) => emit(state.copyWith(
            sendSuggestionsStatus: CallStatus.failed,
            message: failure.message.toString())),
        (message) => emit(state.copyWith(
            message: message, sendSuggestionsStatus: CallStatus.success)));
  }
}
