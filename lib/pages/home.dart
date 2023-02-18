import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    print('passed_value-' + data.toString());

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Column(
          children: [
            // Text('${data['location']}'),
            // Text('${data['flag']}'),
            // Text('${data['time']}'),
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
            Text(data['time'],style: TextStyle(fontSize: 60,letterSpacing: 0),)
          ],
        ),
      ),
    ));
  }
}
