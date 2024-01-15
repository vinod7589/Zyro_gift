import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.textAlign = TextAlign.start,
    this.ContentPadding,
    this.validator,
    this.textController,
    this.hintText,
    this.hintstyle,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxlines = 1,
    this.onChanged,
    this.prefixText,
    this.prefixStyle,
    this.labelText,
    this.textInputAction = TextInputAction.next,
    this.fillColor = Colors.white,
    this.labelColor = Colors.grey,
    this.focussedBorderColor = primary,
    this.textColor,
    this.isBorder = true,
    this.auoFocus = false,
    this.focusNode,
    this.obscure = false,
    this.padding = 0,
    this.isEnabled = true,
    this.maxlength,
  }) : super(key: key);

  final String? hintText;
  final TextStyle? hintstyle;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final TextAlign textAlign;
  final String? labelText;
  final bool readOnly;
  final void Function()? onTap;
  final int? maxlines;
  final int? maxlength;
  final bool isBorder;
  final bool auoFocus;
  final Color fillColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? focussedBorderColor;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool obscure;
  final double padding;
  final EdgeInsets? ContentPadding;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding.h),
        child: TextFormField(
          autofocus: auoFocus,
          textAlign: textAlign,
          onTapOutside: (e) => FocusScope.of(context).unfocus(),
          enabled: isEnabled,
          focusNode: focusNode,
          onChanged: onChanged ?? (val) {},
          readOnly: readOnly,
          onTap: onTap,
          obscureText: obscure,
          maxLength: maxlength,
          maxLines: maxlines,
          controller: textController,
          validator: validator,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: textTheme.bodyLarge!.copyWith(
              fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            fillColor: fillColor,
            errorStyle: const TextStyle(
              fontSize: 10,
              height: 0.1,
            ),
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 370.w),
            isDense: true,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
            labelText: labelText,
            prefixText: prefixText,
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: isBorder ? const Color(0xffC8C8C8) : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: isBorder ? const Color(0xffC8C8C8) : Colors.transparent,
              ),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 16.h),
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
            floatingLabelStyle: TextStyle(
              color: labelColor ?? primary,

              // color: _textFocus.hasFocus ? primary : Colors.grey,
            ),
            hintStyle: hintstyle,
            hintText: hintText,
            suffixIconConstraints: BoxConstraints(maxHeight: 35.h),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefixStyle: prefixStyle,
          ),
        ),
      ),
    );
  }
}
