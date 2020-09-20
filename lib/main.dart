import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/GetLocation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String apikey='6554060f5df3f93d1ee26accc733c80e';
  var description;
  var temp;
  String city;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child:Image.asset('images/dayTime.jpg'),
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text('You are in:', style:
                TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[500],
                ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('$city',style:
                    TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo
                    ) ,),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
            ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                    Icons.wb_sunny,
                    color: Colors.amber,
                ),
                title: Text(
                  'Temperature: ${temp.toString()} C'
                ),
                subtitle: Text('Staus= ${description.toString()}'),
              ),
            ),
            Container(
              child: Center(
                child: FlatButton(
                  child: Text('Get weather info'),
                  color: Colors.lightBlue[500],
                  textColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      getLocation();
                    });
                  },
                )
              )

            ),
          ],
        )
      ),
    );
  }

  //function to display images based on date and time
  displayImage(){
    var now = DateTime.now();
    final currentTime = DateFormat.jm().format(now);
    if( currentTime.contains('AM')){
      return Image.asset('images/dayTime.jpg');
    }
    else if( currentTime.contains('PM')){
      return Image.asset('images/nightTime.jpg');
    }
  }

  void getLocation() async{
    Getlocation getlocation = Getlocation();
    await getlocation.getCurrentLocation();

    print(getlocation.latitude);
    print(getlocation.longitude);
    print(getlocation.city);
    city=getlocation.city;
    getTemp(getlocation.latitude,getlocation.longitude);
  }
  //Get current Temperature
  Future<void> getTemp(double lat,double lon) async{
    http.Response response = await http.get('api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=${apikey}&units=metric');
    print(response.body);

    var dataDecoded = convert.jsonDecode(response.body);
    description = dataDecoded['weather'][0]['description'];
    print(description);
    temp = dataDecoded['main']['temp'];
    print(temp);
}

}


