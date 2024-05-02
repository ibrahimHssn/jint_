import 'package:flutter/material.dart';
import 'package:jint/core/utils/app_icons.dart';
import 'package:jint/core/utils/widget/app_constance.dart';
import 'package:jint/core/utils/widget/text_field.dart';
bool isPasswordVisible=true;
class textFieldPassword extends StatefulWidget {
  final passwordController;
  final emptyErrorText;
  final labelText;

   const textFieldPassword({super.key, required this.passwordController,required this.emptyErrorText,required this.labelText, });


  @override
  State<textFieldPassword> createState() => _textFieldPasswordState();
}

class _textFieldPasswordState extends State<textFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
        child:
        FormFieldUtils().textField(
          readOnly: false,
          context: context,
          controller:widget.passwordController, // Assuming you have defined TextEditingController emailController
          keyboardType: TextInputType.visiblePassword,
          leadingIcon: Icons.lock,
          emptyErrorText:widget.emptyErrorText,
          labelText:widget.labelText,
          borderRadius: 25,
          obscureText:isPasswordVisible,
          trailingIcon:  isPasswordVisible?AppIcons().iconVisibilityOffOutLined:AppIcons().iconVisibilityOutLined,
          onSuffixPressed:() {
            setState(() {
              isPasswordVisible=!isPasswordVisible;
            });
          },
        ),
      );

  }
}
