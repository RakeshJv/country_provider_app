import 'dart:convert';

import 'package:country_provider_app/blocs/country_bloc.dart';
import 'package:country_provider_app/model/country.dart';
import 'package:country_provider_app/network/api_provider.dart';
import 'package:country_provider_app/util/app_colors.dart';
import 'package:country_provider_app/util/app_string.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'countries.dart';


class Region extends StatefulWidget {
  @override
  _RegionState createState() => _RegionState();
}

class _RegionState extends State<Region> {
  CountryBloc _bloc;
  ApiProvider _provider =ApiProvider();
  @override
  void initState() {
    super.initState();
    _bloc = CountryBloc();
    _bloc.fetchCountry();
  }
/*

  Future<String> fetchCountry() async {
    final response = await http.get(AppString.BASE_URL+AppString.API_ALl_COUNTRY);

    List <Country> country=[];
    List <dynamic> data= jsonDecode(response.body);
    print(data.length);

    for( int i =0;i<data.length;i++){
      country.add(Country.fromJson(data.elementAt(i)));
    }
    print(""+country.length.toString());
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,

appBar: AppBar(
    backgroundColor: COLORS.hexToColor(COLORS.APP_COLOR) ,
    title:Text("Region".toUpperCase(),style: TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: AppString.SEGOEUI_FONT,

))),
body:
Container(
child:Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top:10,left: 25 ,right: 20,bottom: 5),
        child: Text("Select a region",textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: AppString.SEGOEUI_FONT
          ),),
      ),
      Expanded(
        child: Center(
          child: StreamBuilder(
            stream:_bloc.countryListStream,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return
                    Padding(
                      padding: EdgeInsets.only(top:5,left: 2,right: 2,bottom: 5),
                      child: ListTile(
                        hoverColor: Colors.black,
                        onTap: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Countries( country:getData(snapshot).elementAt(index), region:getData(snapshot).elementAt(index).region)),
                          );
                        },
                        title: Container(
                            decoration:  BoxDecoration (
                              borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                              color: getData(snapshot).elementAt(index).regionColor,
                            ),
                            child:Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(getData(snapshot).elementAt(index).region,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    fontFamily: AppString.SEGOEUI_FONT

                                  ),))
                        ),
                      ),
                    )
                      ;
                  },
                );
              }else{
                     return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    ],
  ),
),

)
    );
      
      

  }

 List<Country>getData(AsyncSnapshot snapshot)
 {
   List<Country> datas= snapshot.data;
   for( int i=0;i<datas.length;i++){
    print(datas[i].region);
  }
   return datas;
 }
}


class RegionList extends StatelessWidget {
   final List <Country> countryList;
   const RegionList({Key key, this.countryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF202020),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0,
                vertical: 1.0,
              ),
              child: InkWell(
                  onTap: () {
                    },
                  child: SizedBox(
                    height: 65,
                    child: Container(
                      color: Color(0xFF333333),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(
                          countryList.elementAt(index).name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  )));
        },
        itemCount: countryList.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String errorMessage;
  final Function onRetryPressed;
  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: Colors.white,
            child: Text('Retry', style: TextStyle(color: Colors.black)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
