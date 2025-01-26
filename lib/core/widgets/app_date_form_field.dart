import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDateFormField extends StatefulWidget {
  final String name;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const AppDateFormField({
    required this.name,
    this.labelText,
    this.hintText,
    this.validator,
    this.controller,
    this.prefixIcon,
    super.key,
    this.firstDate,
    this.lastDate,
  });

  @override
  _AppDateFormFieldState createState() => _AppDateFormFieldState();
}

class _AppDateFormFieldState extends State<AppDateFormField> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.name,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) AppText(widget.labelText ?? ''),
          FormBuilderDateTimePicker(
            controller: widget.controller,
            name: widget.name,
            inputType: InputType.date,
            initialDate: widget.lastDate ?? DateTime.now(),
            firstDate: widget.firstDate ?? DateTime(1950),
            lastDate: widget.lastDate ?? DateTime.now(),
            validator: (value) => widget.validator != null?(value.toString()):null,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: AppColors.grey),
              filled: true,
              fillColor: AppColors.lightGrey, // Background fill color
              border: outlineInputBorder(AppColors.black),
              enabledBorder: outlineInputBorder(AppColors.primary),
              errorBorder: outlineInputBorder(AppColors.red),
              focusedErrorBorder: outlineInputBorder(AppColors.red),
              contentPadding:
                  const EdgeInsets.all(15.0), // Padding inside the text field
              hintText: widget.hintText, // Placeholder text
              hintStyle: const TextStyle(
                color: AppColors.grey,
              ),
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Icon(
                      widget.prefixIcon,
                      color: AppColors.grey,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        borderSide: BorderSide(
          color: color, // Border color when focused and there's an error
          width: 0.5,
        ),
      );
}
