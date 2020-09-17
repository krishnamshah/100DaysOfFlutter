import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
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
                    child: Text('Damak',style:
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
                title: Text('temp 25 C'),
              ),
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
}


