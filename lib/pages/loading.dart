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
    var data = json.decode(response.body);
    Logger().d(data);
  }

  @override
  void initState() {
    super.initState();
    getData();
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
