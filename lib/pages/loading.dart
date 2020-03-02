import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 // String time = 'loading..';

  void setupWorldTime() async {
    WorldTime worldTime = new WorldTime(location: 'cairo',url: 'Africa/Cairo', flag: 'egypt.jpg');
    await worldTime.getTime();
    // route to another page
   // Navigator.pushNamed(context, '/home');
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' :worldTime.location,
      'time' :worldTime.time,
      'flag' :worldTime.flag,
      'isDayTime': worldTime.isDayTime,
    });

   /* print(worldTime.time);
    setState(() {
      time = worldTime.time;
    });*/


  }


  /*void getData() async{
    Response response =  await get('https://jsonplaceholder.typicode.com/todos/1');
    //print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }*/


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
