import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('init_state_run');
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
      body:ElevatedButton.icon(onPressed: (){
        setState(() {
          counter +=1;
        });
      }, icon: Icon(Icons.ac_unit), label: Text('counter value is ${counter}')),
    );
  }
}
