import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget formSpacer({ratio = 1.0}) {
  return SizedBox(
    height: 16.0 * ratio,
  );
}

Widget rowSpacer({ratio = 1.0}) {
  return SizedBox(
    width: 10.0 * ratio,
  );
}

Paint defaultPaintStroke = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 1
  ..color = Colors.black;

Widget commonTextField({
  String label,
  Function(String) validate,
  TextEditingController ctrl,
  int maxLines,
  int multiLine = 1,
  Function(String) onChanged,
  EdgeInsetsGeometry padding,
}) {
  return Container(
    padding: padding,
    child: TextFormField(
      style: GoogleFonts.parisienne(fontSize: 20),
      controller: ctrl,
      maxLength: maxLines,
      maxLines: multiLine,
      keyboardType: TextInputType.text,
      validator: validate,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: label,
          hintText: label,
          filled: true,
          alignLabelWithHint: true,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          counterText: '',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Color(0xFFFEE391),
              )),
          contentPadding: EdgeInsets.all(20.0)),
    ),
  );
}

Widget primaryButton(
  BuildContext context, {
  String title,
  // num width,
  Color color,
  Function onTap,
  textStyle: const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
  List<BoxShadow> shadow = const [],
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2,
    height: 40,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: shadow),
    child: InkWell(
      onTap: onTap,
      child: Center(
          child: Text(
        '$title',
        textAlign: TextAlign.center,
        style: textStyle,
      )),
    ),
  );
}
