import 'package:flutter/material.dart';
import 'package:world_time_app/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  void setUpTime() async {
    WorldTime instance = WorldTime(
        location: 'Karachi', flag: 'germany.png', url: 'Asia/Karachi');
    await instance.getTime();
    //if (!context.mounted) return;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDay': instance.isDay,
      'url': instance.url,
    });
  }

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.blue[900],
          size: 50.0,
        ),
      ),
    );
  }
}
