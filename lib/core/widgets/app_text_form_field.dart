import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:ansaap_app/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final String? labelText;
  final String? description;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? initalValue;
  final TextEditingController? controller;
  final IconData? prefixIcon;

  const AppTextFormField({
    required this.name,
    this.isPassword = false,
    this.labelText,
    this.hintText,
    this.maxLines,
    this.validator,
    this.initalValue,
    this.onChanged,
    this.controller,
    this.prefixIcon,
    this.description,
    this.maxLength,
    super.key,
  });

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.name,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) AppText(widget.labelText ?? ''),
          FormBuilderTextField(
            controller: widget.controller,
            name: widget.name,
            maxLength: widget.maxLength,
            initialValue: widget.initalValue,
            validator: widget.validator,
            maxLines: widget.maxLines,
            onChanged: (v) {
              if (widget.onChanged != null) {
                widget.onChanged!(v ?? '');
              }
            },
            obscureText: widget.isPassword ? _obscureText : false,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: AppColors.grey),
              filled: true,
              fillColor: AppColors.lightGrey, // Background fill color
              border: outlineInputBorder(AppColors.black),
              enabledBorder: outlineInputBorder(AppColors.primary),
              errorBorder: outlineInputBorder(AppColors.red),
              focusedErrorBorder: outlineInputBorder(AppColors.red),
              counter: SizedBox.shrink(),
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
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
            ),
          ),
          if (widget.description != null)
            AppText(
              widget.description ?? '',
              maxLines: 3,
              fontSize: 13.sp,
              textColor: AppColors.darkGrey,
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
