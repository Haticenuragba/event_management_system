import 'package:eventmanagementsystem/applytoevent/event-detail.dart';
import 'package:eventmanagementsystem/objects/models.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  EventCard({Key key, this.event}) : super(key: key);

  final Event event;

  @override
  _EventCardState createState() => _EventCardState();
}

void navigateToEventDetail(context, event){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EventDetail(event: event)),
  );
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      width: double.maxFinite,
      child: Card(
        child: InkWell(
          onTap: (){navigateToEventDetail(context, widget.event);},
          child: Column(
            children: <Widget>[
              Image(
                width: double.infinity,
                image: NetworkImage(widget.event.image),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        widget.event.title,
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        widget.event.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ))
                    ],
                  ))
            ],
          ),
        ),
        elevation: 3,
      ),
    );
  }
}
