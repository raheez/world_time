
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class WorldTime{

  String location;
  String flag;
  String time='';
  String url;

  WorldTime({required this.location,required this.flag,required this.url});


  Future<void> getTime() async {

    try{
      String url = 'https://www.worldtimeapi.org/api/timezone/${this.url}';
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

      time = now.toString();
      time = DateFormat.jm().format(now);
    }catch(e){

      time = 'error occured,could\'nt fetch ';
    }



  }
}

WorldTime instance = WorldTime(location: 'berlin', flag: 'germany.png' , url: 'europe/berlin');