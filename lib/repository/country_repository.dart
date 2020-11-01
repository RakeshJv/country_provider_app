
import 'dart:convert';

import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/network/api_provider.dart';
import 'package:country_provider_app/util/app_string.dart';
import 'package:http/http.dart';

class CountryRepository {
  ApiProvider _provider = ApiProvider();


  Future<Object> fetchCountryData() async {
  final response = await _provider.get(AppString.BASE_URL+AppString.API_ALl_COUNTRY);

  print("wrrwqrqrqr" +response);
   Object object =response;
  return object;

  }


  Future<List <Country> > fetchCountry() async {


    Response response = await _provider.fetchCountry(AppString.BASE_URL+AppString.API_ALl_COUNTRY);

    List <Country> country=[];
    List <dynamic> data= jsonDecode(response.body);
    print(data.length);
    for( int i =0;i<data.length;i++){
      country.add(Country.fromJson(data.elementAt(i)));
    }

    print("country.length" +country.length.toString());
    return country;

  }




  Future<List <Country> > fetchCountryByRegion(String region) async {
    Response response = await _provider.fetchCountry(AppString.BASE_URL+AppString.API_REGION_COUNTRY+region);

    List <Country> country=[];
    List <dynamic> data= jsonDecode(response.body);
    print(data.length);
    for( int i =0;i<data.length;i++){
      country.add(Country.fromJson(data.elementAt(i)));
    }
    print("country.length------" +country.length.toString());
    return country;

  }

}
