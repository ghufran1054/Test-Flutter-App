// import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time = ""; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDay = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make the request
    try {
      Response response = await get(
          Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      time = data['dateTime'].substring(11, 19);
      isDay = DateTime.parse(data['dateTime']).hour > 6 &&
          DateTime.parse(data['dateTime']).hour < 18;
      time = DateFormat.jm().format(DateTime.parse(data['dateTime']));
    } catch (e) {
      print('caught error: $e');
      time = "Could not get time data";
    }
  }
}
