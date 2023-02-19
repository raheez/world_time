import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void getTime() async {
    WorldTime worldTime =
        WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    print('fetched_value_is_' + worldTime.time);

    print('Navigator' + worldTime.mIsDay.toString());
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDay': worldTime.mIsDay
    });
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('choose location'),
      ),
      body: Center(
        child: Text('${time.toString()}'),
      ),
    );
  }
}
