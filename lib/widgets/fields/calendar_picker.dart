import 'package:etiqa/providers/user_provider.dart';
import 'package:etiqa/widgets/fields/field_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget etiqaTextDateFloat(
  BuildContext context, {
  required String labelText,
  bool readOnly = true,
  int maxLine = 1,
  Widget? suffixIcon,
  TextInputType? keyboardType,
  TextAlign textAlign = TextAlign.start,
  bool isRequired = false,
  bool isPassword = false,
  Function(dynamic)? onValueChanged,
  Function()? onTap,
  TextEditingController? controller,
  int? maxLength,
  Color colorBorder = Colors.black,
  dynamic initialValue,
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
              styleHintText: styleHintText,
              suffixIcon: InkWell(
                onTap: () => Provider.of<UserProvider>(context, listen: false)
                    .setDatePicker(context, controller, onValueChanged),
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.black,
                ),
              ),
              colorLabel: Colors.black,
            ),
          ),
        ],
      ));
}
