
import 'dart:async';
import 'dart:collection';
import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/network/response.dart';
import 'package:country_provider_app/repository/country_repository.dart';
import 'package:country_provider_app/util/app_colors.dart';
import 'package:country_provider_app/util/app_string.dart';

class CountryBloc {
  CountryRepository _countryRepository;


  StreamController _countryListController;
  StreamSink<List<Country>> get countryListSink => _countryListController.sink;
  Stream<List<Country>> get countryListStream => _countryListController.stream;

  CountryBloc() {
     _countryListController = StreamController<List<Country>>();
    _countryRepository = CountryRepository();
    }

  fetchCountry() async {
     List <Country>data=[];
     try {
      data=  await _countryRepository.fetchCountry();
      Map map2 = {};
      data.forEach((customer) => map2[customer.region] = customer);
      data.clear();
      map2.entries.forEach((e) => data.add(e.value));
      List <Country>temp=[];

      for( int i =0;i<data.length;i++){

        if(data.elementAt(i).region ==null || data.elementAt(i).region =="" || data.elementAt(i).region.length==0 )
        {
        }
        else{
          data.elementAt(i).regionColor=COLORS.regionColorList[i];
          data.elementAt(i).countryColor=COLORS.countryColor[i];

          temp.add(data.elementAt(i));
        }
      }
      data.clear();

      data.addAll(temp);

      print(data.length);
      countryListSink.add(data);
    } catch (e) {
      print(e);
    }
  }


  fetchCountryByRegion(String region) async {
    List <Country>data=[];
    try {
      data=  await _countryRepository.fetchCountryByRegion(region);
      print("-----"+data.length.toString());


     /* Map map2 = {};
      data.forEach((customer) => map2[customer.region] = customer);
      data.clear();
      map2.entries.forEach((e) => data.add(e.value));
      print(data.length);*/
      countryListSink.add(data);
    } catch (e) {
      print(e);
    }
  }

  dispose() {
    _countryListController?.close();
     countryListSink?.close();

  }
}