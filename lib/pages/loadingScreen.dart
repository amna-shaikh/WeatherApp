import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mynewapplication/Helperclass.dart';
import 'package:mynewapplication/pages/homeScreen.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);
  @override
  _loadingScreenState createState() => _loadingScreenState();
}
class _loadingScreenState extends State<loadingScreen>
{
  var city  ;
  var temp;
  var humidity;
  var air;
  var description;
  var main;
  var icon;
  void startApp(String city) async {
    if(city.length ==0){city = 'hyderabad';}
    Helperclass instance = Helperclass(location: city);
    await instance.getAPIdata();
    temp = instance.temp;
    humidity = instance.humidity;
    air = instance.air;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/homeScreen', arguments:{
        "temp_value" : temp ,
        "hum_value": humidity,
        "air_value": air,
        "desc_value" : description,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city

      } );
    });
  }
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   // print(homeScreen.searchtext);
    //var search = ModalRoute.of(context)!.settings.arguments as Map;
   // city = homeScreen.searchtext;
    if(homeScreen.searchtext != null ){
      city = homeScreen.searchtext;
    }
   /* if(search.isNotEmpty ){
      city = search["SearchText"];
      print("city after build $city");
    }*/
    //else{}

    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 180,),
                Image.asset("assets/images/logo.png" , height: 240,width: 180,),
                Text("Weather App  " , style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
                SizedBox(height: 10,),
                Text("Made by Amna",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
                SizedBox(height: 30,),
                SpinKitWave(
                  color: Colors.white,
                  size: 50.0,
                )
              ]),
        ),
      ),
      backgroundColor: Colors.lightBlue[600],
    );
  }
}
