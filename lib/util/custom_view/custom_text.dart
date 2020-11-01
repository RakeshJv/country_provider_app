import 'package:country_provider_app/util/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends Text{
String data;
double fontSize;
Color colors;
  CustomText({this.data,this.fontSize,this.colors})
      :super(
       data ,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        color:colors,
        fontFamily: AppString.SEGOEUI_FONT,
      )
  );
}