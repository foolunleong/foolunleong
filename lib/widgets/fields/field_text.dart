import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

InputDecoration etiqaInputDecoration(
    {String? hintText,
    TextStyle? styleHintText,
    Color colorLabel = Colors.black87,
    Color colorBorder = Colors.black,
    Color? fillColor,
    Widget? suffixIcon}) {
  return InputDecoration(
    // labelText: labelText,
    // labelStyle: TextStyle(color: colorLabel),
    hintText: hintText,
    hintStyle: styleHintText,
    suffixIcon: suffixIcon,
    fillColor: fillColor,
    filled: fillColor == null ? false : true,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: colorBorder, width: colorBorder == Colors.black ? 0.2 : 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: colorBorder, width: colorBorder == Colors.black ? 0.2 : 1.0),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 0.2),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.2),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.2),
    ),
  );
}

Widget etiqaReactiveTextField(
  BuildContext context, {
  required String labelText,
  bool readOnly = false,
  int maxLine = 1,
  Widget? suffixIcon,
  TextInputType? keyboardType,
  TextAlign textAlign = TextAlign.start,
  bool isRequired = false,
  bool isPassword = false,
  Function(dynamic)? onValueChanged,
  Function? onSubmit,
  int? maxLength,
  Color colorBorder = Colors.black,
  dynamic initialValue,
  TextEditingController? controller,
  String? hintText,
  TextStyle? styleHintText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          initialValue: initialValue,
          onChanged: onValueChanged,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLine,
          readOnly: readOnly,
          textInputAction: TextInputAction.next,
          textAlign: textAlign,
          maxLength: maxLength,
          focusNode: readOnly ? AlwaysDisabledFocusNode() : null,
          decoration: etiqaInputDecoration(
              colorBorder: colorBorder,
              suffixIcon: suffixIcon,
              hintText: hintText,
              styleHintText: styleHintText,
              colorLabel: Colors.red),
        ),
      ],
    ),
  );
}
