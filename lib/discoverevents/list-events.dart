
import 'package:eventmanagementsystem/discoverevents/event-card.dart';
import 'package:eventmanagementsystem/objects/models.dart';
import 'package:eventmanagementsystem/service/HttpService.dart';
import 'package:flutter/material.dart';

class ListEvents extends StatefulWidget {
  ListEvents({Key key, this.title}) : super(key: key);


  final String title;


  @override
  _ListEventsState createState() => _ListEventsState();
}

class _ListEventsState extends State<ListEvents> {
  int _counter = 0;
  final HttpService httpService = HttpService();

  Future<List<Event>> futureEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureEvents = httpService.getEvents();
  }
  Future<void> _refresh() async {
      this.setState(() {futureEvents = httpService.getEvents();});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(child:FutureBuilder(
        future: futureEvents,
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            List<Event> events = snapshot.data;
            return SingleChildScrollView(child: Column(children: <Widget>[
              for(var e in events) EventCard(event: e)
            ]));

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      onRefresh: _refresh,)
    );
  }
}
