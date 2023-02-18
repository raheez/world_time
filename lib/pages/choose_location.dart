import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    //simulate nw request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      print('yoshi');
      return 'yoshi';
    });

    String bio = await Future.delayed(Duration(seconds: 4), () {
      print('this is the bio');
      return 'this is the bio';
    });

    print('statement');
    print('$username-$bio');
  }

  @override
  void initState() {
    super.initState();
    print('init_state_run');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build_state_run');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton.icon(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          icon: Icon(Icons.ac_unit),
          label: Text('counter value is ${counter}')),
    );
  }
}
