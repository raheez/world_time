import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}


class _LoadingState extends State<Loading> {

  void getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    final response = await get(Uri.parse(url));
    print(response.body);
    Map data = jsonDecode(response.body);
    String name = data['title'];
    String age = data['body'];
    Logger().d('value_of_name_'+name);
    Logger().d('value_of_body_'+age);
  }

  void getTime() async {
    String url = 'https://www.worldtimeapi.org/api/timezone/Europe/London';
    final response = await get(Uri.parse(url));
    print(response.body);
    Map data = jsonDecode(response.body);
    String dateTime = data['datetime'];
    String utc_offset = data['utc_offset'].toString().substring(1,3);
    Logger().d('value_of_dateTime_'+dateTime);
    Logger().d('value_of_utc_offset_'+utc_offset);
    
    DateTime now = DateTime.parse(dateTime);
    Logger().d('value_of_now_'+now.toString());

    now = now.add(Duration(hours: int.parse(utc_offset)));
    Logger().d('value_of_now_'+now.toString());

  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('loading areas'),
      ),
    );
  }
}
