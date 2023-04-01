import 'package:flutter/material.dart';
import 'package:world_time_app/pages/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Karachi', flag: 'pakistan.png', url: 'Asia/Karachi'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  WorldTime instance = locations[index];
                  await instance.getTime();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, {
                    'location': locations[index].location,
                    'flag': locations[index].flag,
                    'time': locations[index].time,
                    'isDay': locations[index].isDay,
                    'url': locations[index].url,
                  });
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[900],
                  // backgroundImage:
                  //     AssetImage('images/${locations[index].flag}'),
                ),
              ),
            );
          }),
    );
  }
}
