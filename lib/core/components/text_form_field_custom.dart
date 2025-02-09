import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  // 상단 섹션 텍스트 관련
  final String? sectionText;
  final Color sectionTextColor;

  // 읽기 전용 텍스트 관련
  final bool isReadOnlyText;
  final String? readOnlyTitle;

  // TextFormField 관련
  final String? defaultText;
  final String? hintText;
  final bool isPasswordField;
  final bool? isEnabled;
  final int? maxLines;
  final bool isReadOnly;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;

  const TextFormFieldCustom({
    super.key,
    // 섹션 텍스트
    this.sectionText,
    this.sectionTextColor = Colors.black,

    // 읽기 전용 텍스트
    this.isReadOnlyText = false,
    this.readOnlyTitle,

    // TextFormField 속성들
    this.defaultText,
    this.hintText,
    this.isPasswordField = false,
    this.isEnabled,
    this.maxLines = 1,
    this.isReadOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 섹션 텍스트가 있는 경우 표시
        if (sectionText != null) ...[
          Text(
            sectionText!,
            style: TextStyle(
              color: sectionTextColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // 읽기 전용 텍스트인 경우
        if (isReadOnlyText && readOnlyTitle != null)
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                readOnlyTitle!,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          )
        // TextFormField인 경우
        else
          TextFormField(
            controller: controller,
            initialValue: defaultText,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              filled: true,
              fillColor: isEnabled == false
                  ? Theme.of(context).colorScheme.surfaceContainerHighest
                  : Theme.of(context).colorScheme.surface,
            ),
            obscureText: isPasswordField,
            enabled: isEnabled,
            maxLines: maxLines,
            readOnly: isReadOnly,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            onTap: onTap,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
      ],
    );
  }
}
