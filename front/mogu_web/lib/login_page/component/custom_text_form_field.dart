import 'package:flutter/material.dart';
import 'package:mogu_web/common/const/colors.dart';
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction; // 추가
  final Function(String)? onFieldSubmitted; // 추가

  const CustomTextFormField({
    required this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.validator,
    this.textInputAction, // 추가
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    return TextFormField(
      cursorColor: DEVELOPER_COLOR,
      // 비밀번호 입력할때
      validator: validator,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      textInputAction: textInputAction, // 추가
      onFieldSubmitted: onFieldSubmitted, // 추가
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(3),
        hintText: hintText,
        errorText: errorText,
        hintStyle: TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 17.0,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
        fillColor: INPUT_BG_COLOR,
        // false - 배경색 없음
        // true - 배경색 있음
        filled: true,
        // 모든 Input 상태의 기본 스타일 세팅
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: DEVELOPER_COLOR,
          ),
        ),
      ),
    );
  }
}
