import 'package:country_provider_app/util/app_colors.dart';
import 'package:flutter/material.dart';
import '../app_string.dart';
class CustomAppBar extends AppBar {

  final Function appHomeOnTap;
  final Function onLogoutTap;
  CustomAppBar({ this.appHomeOnTap,this.onLogoutTap,bool isHomeIconVisible,String title

  })
      : super(
      backgroundColor: COLORS.hexToColor(COLORS.APP_COLOR),
      leading:  InkWell(child:Icon(Icons.menu, color: Colors.white),
        onTap:appHomeOnTap()
     ),
      primary: false,
      title: Text(title
       ),
      actions: <Widget>
      [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
              child:Visibility(
                visible: isHomeIconVisible ,
                child: new InkWell(
                  // this is the one you are looking for..........
                  child: new Container(
                    padding: const EdgeInsets.all(
                        05.0), //I used some padding without fixed width and height
                    decoration: new BoxDecoration(
                      shape: BoxShape
                          .circle, // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    child:
                    Image(image: AssetImage("images/imlogo.png")),
                  ),
                 // onTap: appHomeOnTap("Home")
                ),
              )
          ),
        ),
        InkWell(
            onTap: onLogoutTap,
            child:
        Image(
          image: AssetImage("images/signout.png"),
          color: Colors.white,
        )
        ),
      ],
    );
}