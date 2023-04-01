//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/pages/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timeData = {};
  String bgImage = '';
  late Color textColor;
  @override
  Widget build(BuildContext context) {
    timeData = timeData.isEmpty
        ? ModalRoute.of(context)!.settings.arguments as Map
        : timeData;
    bgImage = timeData['isDay'] ? 'day.jpeg' : 'night.jpeg';
    textColor = timeData['isDay'] ? Colors.black : Colors.white;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              WorldTime instance = WorldTime(
                  location: timeData['location'],
                  flag: timeData['flag'],
                  url: timeData['url']);
              await instance.getTime();
              setState(() {
                timeData = {
                  'location': instance.location,
                  'flag': instance.flag,
                  'time': instance.time,
                  'isDay': instance.isDay,
                  'url': instance.url,
                };
              });
            },
            backgroundColor: Colors.blue[900],
            child: const Icon(Icons.refresh)),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic response = await Navigator.pushNamed(
                            context, '/chooseLocation');
                        if (response != null) {
                          setState(() {
                            timeData = {
                              'location': response['location'],
                              'flag': response['flag'],
                              'time': response['time'],
                              'isDay': response['isDay'],
                              'url': response['url'],
                            };
                          });
                        }
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[350],
                      ),
                      label: Text(
                        'choose Location',
                        style: TextStyle(color: Colors.grey[350]),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        timeData['location'],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    timeData['time'],
                    style: TextStyle(
                      fontSize: 50,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
