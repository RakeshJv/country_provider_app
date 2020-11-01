import 'dart:convert';

import 'package:country_provider_app/blocs/country_bloc.dart';
import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/network/api_provider.dart';
import 'package:country_provider_app/util/app_colors.dart';
import 'package:country_provider_app/util/app_string.dart';
import 'package:emoji_flag_converter/emoji_flag_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countries.dart';
import 'country_detail.dart';

class Countries extends StatefulWidget {
  String region = "";
 Country country;
  Countries({this.country, this.region});

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  CountryBloc _bloc;
  ApiProvider _provider = ApiProvider();
  String region = "";
  Country country;

  @override
  void initState() {
    super.initState();
    region = widget.region;
    country =widget.country;
    _bloc = CountryBloc();
    _bloc.fetchCountryByRegion(region);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar( backgroundColor: COLORS.hexToColor(COLORS.APP_COLOR) , title: Text(region.toUpperCase()
        ,
          style: TextStyle
            (
            fontSize: 15,
            color: Colors.white,
            fontFamily: AppString.SEGOEUI_FONT,
          ),
        )),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top:10,left: 25 ,right: 20,bottom: 5),
                  child: Text("Select a country",textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: AppString.SEGOEUI_FONT
                    ),),
                ),
                Expanded(
                  child: Center(
                    child: StreamBuilder(
                      stream: _bloc.countryListStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CountryDetails(
                                              country: getData(snapshot)
                                                  .elementAt(index))),
                                    );
                                  },
                                  title: Container(
                                    decoration:  BoxDecoration (
                                        borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                                      color:country.countryColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              getData(snapshot)
                                                  .elementAt(index)
                                                  .name,
                                              style: TextStyle(
                                                  fontSize: 17  ,
                                                  color: Colors.white,
                                                  fontFamily: AppString.SEGOEUI_FONT

                                              ),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              setemoji(getData(snapshot)
                                                  .elementAt(index)),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black87),
                                            )),

                                      ],
                                    ),
                                  ));
                            },
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List<Country> getData(AsyncSnapshot snapshot) {
    List<Country> datas = snapshot.data;
    for (int i = 0; i < datas.length; i++) {
      print(datas[i].region);
    }
    return datas;
  }

  String setemoji(Country country) {
    var result = EmojiConverter.fromAlpha2CountryCode(country.alpha2Code);
    print('And here is your result: $result');
    return result;
  }
}
