import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/model/currencies.dart';
import 'package:country_provider_app/util/app_colors.dart';
import 'package:country_provider_app/util/app_string.dart';
import 'package:country_provider_app/util/custom_view/custom_text.dart';
import 'package:emoji_flag_converter/emoji_flag_converter.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  Country country;

  CountryDetails({this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: COLORS.hexToColor(COLORS.APP_COLOR),
          title: Text(country.region.toUpperCase() +" / "+country.name.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: AppString.SEGOEUI_FONT,
              ))),
      body: Container(
        padding: new EdgeInsets.only(left: 0.0, bottom: 8.0, right: 0.0),
        decoration: new BoxDecoration(color: Colors.white),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          /*  Container(
                color: COLORS.hexToColor(COLORS.APP_COLOR_SECONDARY),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        country.region = "Africa / ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: AppString.SEGOEUI_FONT,
                        ),
                      ),
                      Text(
                        country.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: AppString.SEGOEUI_FONT,
                        ),
                      ),
                    ],
                  ),
                )),*/
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child:
                  Text(
                    setemoji(country),textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 70, color: Colors.black87),
                  ),
                ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children:<Widget> [
                            CustomText(
                                  data: country.name,
                                  fontSize: 28,
                                  colors: Colors.black),
                            Padding(
                              padding: EdgeInsets.only(top: 10, left:5),
                              child: CustomText(
                                  data: getCountryCioc(country),
                                  fontSize: 18,
                                  colors: Colors.black),
                            ),
                          ],
                        ),
                        CustomText(
                            data: country.capital,
                            fontSize: 18,
                            colors: Colors.black),
                      ],
                    ),
                  ),

              ],
            ),







            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(0),
                child: Card(
                  child:Padding(
                padding: EdgeInsets.only(top:10 ,bottom: 10 ,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                          data: "Demonym",
                          fontSize: 18,
                          colors: Colors.black54),
                      CustomText(
                          data: country.demonym.toString(),
                          fontSize: 28,
                          colors: Colors.black),
                    ],
                  ),
                )
                ), 
            ),
                ),
                Expanded(
                  child:
                  Card(
                     child:Padding(
                padding: EdgeInsets.only(top:10 ,bottom: 10 ,left: 10),

                   child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                            data: "Calling Code",
                            fontSize: 18,
                            colors: Colors.black54),
                        CustomText(
                            data: country.callingCodes.elementAt(0).toString(),
                            fontSize: 28,
                            colors: Colors.black),
                      ],
                    ),
                     ),

                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(0),
                    child: Card(


                        child:Padding(
                          padding: EdgeInsets.only(top:0 ,bottom: 10 ,left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText(
                                  data: "Currency",
                                  fontSize: 18,
                                  colors: Colors.black54),
                              CustomText(
                                  data: currencyData(country),
                                  fontSize: 28,
                                  colors: Colors.black),
                            ],
                          ),
                        )
                    ),
                  ),
                ),
                Expanded(
                  child:
                  Card(
                    child:Padding(
                      padding: EdgeInsets.only(top:0 ,bottom: 10 ,left: 10),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomText(
                              data: "Population",
                              fontSize: 18,
                              colors: Colors.black54),
                          CustomText(
                              data: country.population.toString(),
                              fontSize: 28,
                              colors: Colors.black),
                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String currencyData(Country country) {
    return country.currencies.elementAt(0).symbol +
        " " +
        country.currencies.elementAt(0).name;
  }

  String getCountryCioc(Country country) {
    String data = "";
    if (country.cioc != null && country.cioc.length > 0) {
      data = "(" + country.cioc + ")";
    } else {
      data = "";
    }
    return data;
  }

  String setemoji(Country country) {
    var result = EmojiConverter.fromAlpha2CountryCode(country.alpha2Code);
    print('And here is your result: $result');
    return result;
  }
}
