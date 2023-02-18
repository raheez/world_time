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
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    print('fetched_value_is_'+worldTime.time);

    setState(() {
      time = worldTime.time;
    });

    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : time
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
      body: SizedBox(
        child: Text('${time.toString()}'),
      )
      ,
    );
  }
}
