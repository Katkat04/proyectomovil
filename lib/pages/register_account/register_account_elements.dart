import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final bool filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    required this.labelText,
    required this.hintText,
    this.filled = true,
    this.fillColor,
    this.suffixIcon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0x00000000),
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: 'Lexend',
                letterSpacing: 0.0,
              ),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontFamily: 'Lexend',
                letterSpacing: 0.0,
              ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          focusedErrorBorder: outlineInputBorder,
          filled: filled,
          fillColor: fillColor ?? Theme.of(context).secondaryHeaderColor,
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
          suffixIcon: suffixIcon,
        ),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontFamily: 'Lexend',
              letterSpacing: 0.0,
            ),
        validator: validator,
      ),
    );
  }
}
