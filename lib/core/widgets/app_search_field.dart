import 'package:ansaap_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: AppColors.grey),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: _outlineInputBorder(AppColors.black),
        enabledBorder: _outlineInputBorder(Colors.transparent),
        errorBorder: _outlineInputBorder(AppColors.red),
        focusedErrorBorder: _outlineInputBorder(AppColors.red),
        disabledBorder: _outlineInputBorder(AppColors.grey),
        contentPadding: const EdgeInsets.all(15.0),
        hintText: 'البحث علي مشروع',

        hintStyle: const TextStyle(
          color: AppColors.grey,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.grey,
        ),
      ),
    );
  }


  OutlineInputBorder _outlineInputBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0), // Rounded corners
    borderSide: BorderSide(
      color: color, // Border color when focused and there's an error
      width: 0.5,
    ),
  );
}
