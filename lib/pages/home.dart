import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  var mBgImage;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    mBgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color mBgColor = data['isDay'] ? Colors.blue : Colors.indigo;

    print('passed_value-' + data.toString());
    print('mBgImage_value-' + mBgImage);

    return Scaffold(
        backgroundColor: mBgColor,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/${mBgImage}'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text('edit location')),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(fontSize: 60, letterSpacing: 0),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
