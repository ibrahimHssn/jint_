import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jint/core/utils/app_color.dart';

class FormFieldUtils{
   textField({
    required BuildContext context,
    required TextEditingController controller,
    required TextInputType? keyboardType,
    required IconData? leadingIcon,
    required String? labelText,
    required String? emptyErrorText,
    bool readOnly = false,
    bool autofocus = false,
    bool obscureText = false,
    bool isEnabled = true,
    Function(String)? onSubmitted,
    Function(String)? onChanged,
    Function()? onSuffixPressed,
    Function()? onTap,
    FocusNode? focusNode,
    IconData? trailingIcon,
    double borderRadius = 0,
    bool hasMaxLength = false,
    int? maxLength,
    int? remainingCharacters,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      autofocus: autofocus,
      enabled: isEnabled,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      focusNode: focusNode,

      inputFormatters: hasMaxLength ? [LengthLimitingTextInputFormatter(maxLength)] : null,
      validator: (value) {
        if (value!.isEmpty) {
          return '$emptyErrorText';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        suffixText: hasMaxLength ? ' ${maxLength! - controller.text.length}' : null,
        prefixIcon: Icon(leadingIcon,color: AppColors().prefixIcon),
        suffixIcon: trailingIcon != null
            ? IconButton(
          onPressed: onSuffixPressed,
          icon: Icon(trailingIcon),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  int getDefaultMaxCharacterCount({required int count}) {
    return count;
  }

  int getMaxCharacterCount(int defaultValue) {
    return defaultValue.clamp(0, double.infinity).toInt();
  }

  int getRemainingCharacterCount(int maxCharacterCount, String value) {
    return getMaxCharacterCount(maxCharacterCount) - value.length;
  }



}