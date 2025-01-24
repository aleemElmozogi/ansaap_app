import 'package:ansaap_app/core/enums/fetch_status.dart';
import 'package:ansaap_app/core/utils/dialog_extension.dart';
import 'package:ansaap_app/core/validation/input_validation.dart';
import 'package:ansaap_app/core/widgets/app_button.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:ansaap_app/core/widgets/app_text_form_field.dart';
import 'package:ansaap_app/core/widgets/loading_indicator.dart';
import 'package:ansaap_app/features/authenticated/sendSuggestion/presentation/cubit/send_suggestion_cubit.dart';
import 'package:ansaap_app/features/authenticated/sendSuggestion/presentation/cubit/send_suggestion_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ansaap_app/core/di/injection.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/send_suggestion_button.dart';

part '../listeners/send_suggestion_listener.dart';

class SendSuggestionScreen extends StatelessWidget {
  SendSuggestionScreen({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>di.getIt<SendSuggestionCubit>(),
      child: BlocListener<SendSuggestionCubit, SendSuggestionState>(
        listenWhen: (previous, current) =>
        previous.sendSuggestionsStatus != current.sendSuggestionsStatus,
        listener: suggestionListener,
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                AppText('أدخل اقتراحك',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                ),
                AppTextFormField(
                  name: 'suggestion',
                  validator: InputValidation.requiredValidation(),
                  maxLines: 10,
                ),
                _SendSuggestionButton(formKey: _formKey,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on FormBuilderState {
  ({String suggestion})? get input {
    final suggestion = value['suggestion'] as String?;
    if (suggestion == null) return null;
    return (suggestion: suggestion);
  }
}
