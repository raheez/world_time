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

  void getTime() async {
    WorldTime worldTime = WorldTime(location: 'berlin', flag: 'berlin.png', url: 'europe');
    await worldTime.getTime();
    print('fetched_value_is_'+worldTime.time);
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
