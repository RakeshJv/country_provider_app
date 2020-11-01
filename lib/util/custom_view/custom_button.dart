import 'package:country_provider_app/util/app_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends Text{
  String data;
  CustomButton({this.data})
      :super(
      data ,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,

        fontFamily: AppString.SEGOEUI_FONT,
      )
  );
}