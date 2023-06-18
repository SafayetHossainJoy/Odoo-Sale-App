import 'package:flutter/material.dart';
import 'package:sale/widgets/band_color.dart';

class CustomTextFieldforcustomer extends StatelessWidget {
  const CustomTextFieldforcustomer({
    super.key,
    this.icon,
    this.keytype,
    this.lebelText,
    this.keyy,
    this.maxNumber,
    this.controller,
    this.validator,
    this.data,
    this.hintText,
    this.initialText,
    this.prefixIcon,
    this.formatter,
    this.onChangeFunction,
    this.prefixText,
    this.title,
    required this.validatorFn,
  });

  final TextEditingController? controller;
  final dynamic onChangeFunction;
  final dynamic data;
  final dynamic icon;
  final dynamic prefixIcon;
  final String? initialText;
  final dynamic validator;
  final String? hintText;
  final int? maxNumber;
  final String? lebelText;
  final dynamic formatter;
  final dynamic keytype;
  final String? prefixText;
  final String? title;
  final String? Function(dynamic value) validatorFn;

  final String? keyy;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 45,
      child: TextFormField(
        //minLines: 1,
        onChanged: onChangeFunction,
        maxLines: maxNumber,
        initialValue: initialText,
        keyboardType: keytype,
        controller: controller,
        inputFormatters: formatter,
        validator: validator,
        // onSaved: (String value) => data[keyy] = value,
        //  onChanged: onChangeFunction,
        autofocus: false,
        style: myStyle(14.0, Colors.black54),
        decoration: InputDecoration(
          // hoverColor: Colors.black,
          filled: true,
          prefixText: prefixText,
          errorStyle: myStyle(
              12,
              const Color.fromARGB(255, 240, 66, 66).withOpacity(0.9),
              FontWeight.w500),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueAccent, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 88, 86, 86),
              width: 1,
            ),
          ),

          labelText: hintText,
          hintStyle: myStyle(12, Colors.black54),
          prefixIcon: prefixIcon,
          suffixIcon: icon,
          labelStyle: myStyle(12, Colors.black54),
          hintText: lebelText,
        ),
      ),
    );
  }
}
