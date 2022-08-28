import 'dart:convert';
import 'package:http/http.dart';
class Helperclass {
  var location ;
  var temp;
  var humidity;
  var air;
  var description;
  var main;
  var icon;
  Helperclass({this.location}){
    location = this.location;
  }
  Future<void> getAPIdata() async {
    print("location :$location");
    try{
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c3facf393ca4e856c949a795d479f649');
      //https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=c3facf393ca4e856c949a795d479f649');
      Response response = await get(url);
      Map data = jsonDecode(response.body);

      List weather_data = data['weather'];
      Map getweather_main_data = weather_data[0];
      String getmain_des = getweather_main_data['main'];
      String getdesc = getweather_main_data['description'];

      Map temp_data = data['main'];
      var gethumidity = temp_data["humidity"];
      var gettemp = temp_data['temp'] - 273.16;

      Map wind = data['wind'];
      var getair_speed = wind["speed"]/0.277777777778;

      //Assign values
      temp = gettemp;
      humidity = gethumidity;
      air = getair_speed;
      description = getdesc;
      main = getmain_des;
      icon = getweather_main_data["icon"].toString();
    }
    catch(e){
      temp = "NA";
      humidity = "NA";
      air = "NA";
      description = "can't find data in";
      main = "NA";
      icon="03n";
    }
  }

}