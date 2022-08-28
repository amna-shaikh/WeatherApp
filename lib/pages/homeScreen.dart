import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'loadingScreen.dart';

class homeScreen extends StatelessWidget {
  Map? info = {};
  static String searchtext ='';
  TextEditingController searchcontroller = TextEditingController();
  void timer(){
    Future.delayed(Duration (seconds: 3),(){
    });
  }
  @override
  Widget build(BuildContext context) {

    var city_name = ["Hyderabad" , "Karachi","Multan", "Peshawar", "Islamabad"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    // info  = (info?.isNotEmpty ?? false) ? info : ModalRoute.of(context)!.settings.arguments as Map?;
     info = ModalRoute.of(context)!.settings.arguments as Map? ;
    String temp = ((info?['temp_value']).toString());
    var air = ((info?['air_value']).toString());
    if(temp == 'NA'){}
    else{
      temp = ((info?['temp_value']).toString()).substring(0,4);
      air = ((info?['air_value']).toString()).substring(0,4);

    }
    var icon = info?['icon_value'];
    var location = info?['city_value'];
    var humidity = info?['hum_value'];
    var des = info?['desc_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.blue,),
      ),
      //appBar: PreferredSize( preferredSize: Size.fromHeight(0),
      // child: GradientAppBar(

      // gradient : LinearGradient(
      // colors: [Colors.blue , Colors.blueAccent]
      //begin : Alignmnet.topRight,
      //end : Alignment.Center
      // ))

      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.blueAccent
                  //Colors.blue[300]
                ],
                //stops: [0.1,0.4]

              )),
              child: Column(children: [
                Container(
                  padding : EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)
                  ),
                  child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            if((searchcontroller.text).replaceAll(" ", " ")==""){}
                            // if(searchcontroller.text.isEmpty){}
                            else{
                              searchtext = searchcontroller.text;
                              print("searchtext $searchtext");
                             /* Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>loadingScreen() ),
                              );*/
                              Navigator.pushReplacementNamed(context, '/loadingScreen');
                            } },
                          child:Container(child: Icon(Icons.search), margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                        ),
                        Expanded(child: TextField(
                          controller: searchcontroller,
                          decoration: InputDecoration(
                              hintText: "Search $city" ,
                              border: InputBorder.none
                          ),

                        ) )

                      ]),
                ),

                Row(
                    children:[ Expanded(
                      child: Container(
                        //child: Text(),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(26),
                        child: Row(
                          children: [
                            Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text('$des',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text('$location',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),]
                ),
                Row(
                    children:[ Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.thermometer),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("$temp",style: TextStyle(
                                      fontSize: 90
                                  ),),
                                  Text("C",style: TextStyle(
                                      fontSize: 30
                                  ),)
                                ],)

                            ]),
                      ),
                    ),]
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        //child: Text(),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [ Icon(WeatherIcons.wind),],
                            ),
                            SizedBox(height:30),
                            Text("$air",style: TextStyle(fontSize: 40,
                                fontWeight: FontWeight.bold),
                            ),
                            Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //child: Text(),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [ Icon(WeatherIcons.humidity),],
                            ),
                            SizedBox(height:30),
                            Text("$humidity",style: TextStyle(fontSize: 40,
                                fontWeight: FontWeight.bold),
                            ),
                            Text("%")
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ Text("Madee by AMNA"),
                        Text("Data provided by Openweather.org")]),
                )




              ] ),
            )),
      ),



    );
  }
}

