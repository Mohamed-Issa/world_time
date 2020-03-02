import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location; // location name of the UI
  String time; // the time in that location
  String flag; // url to asset flag notation
  String url; // location url for api endpoint  - Africa/Cairo
  bool isDayTime; //

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime () async {

    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String utcOffset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(utcOffset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      // print(now);
      now = now.add(Duration(hours: int.parse(utcOffset)));
      //print(now);

      //time = now.toString();
      isDayTime = now.hour >= 6 && now.hour <= 20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error $e');
      time = 'could not get time data';
    }
  }
}

