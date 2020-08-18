import 'dart:convert';

import 'package:eventmanagementsystem/objects/models.dart';
import 'package:http/http.dart';

final String baseUrl = "http://10.0.2.2:8080";
final String eventsUrl = baseUrl + "/events";
final String addApplicationUrl = baseUrl + "/events-application/";

class HttpService{
  Future<List<Event>> getEvents() async {
    Response res = await get(eventsUrl, headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(utf8.decode(res.bodyBytes));

      List<Event> events = body
          .map(
            (dynamic item) => Event.fromJson(item),
      )
          .toList();
      print(events);
      return events;
    } else {
      throw "Can't get events.";
    }
  }

  Future<bool> postApplication(String eventTitle, Application application) async {
    Response res = await post(addApplicationUrl + eventTitle, body: jsonEncode(application), headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      print(res);
      return true;
    } else {
      return false;
    }
  }

}
