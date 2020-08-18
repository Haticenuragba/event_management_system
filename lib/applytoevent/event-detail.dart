import 'dart:convert';

import 'package:eventmanagementsystem/objects/models.dart';
import 'package:eventmanagementsystem/service/HttpService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventDetail extends StatefulWidget {
  EventDetail({Key key, this.event}) : super(key: key);

  final Event event;

  @override
  _EventDetailState createState() => _EventDetailState();
}


class _EventDetailState extends State<EventDetail> {

  Application application;
  List<ApplicationCustomAttribute> applicationCustomAttributes;
  final HttpService httpService = HttpService();

  @override
  void initState() {
    application = new Application();
    applicationCustomAttributes = new List<ApplicationCustomAttribute>(widget.event.customAttributes.length);
  }

  void handleInputChange(value, name) {
    application.assignProperty(name, value);
  }

  void handleCustomAttributeChange(question, type, answer, index) {
    print("Degismeye geldim");
    applicationCustomAttributes[index] = new ApplicationCustomAttribute(question: question, type: type, answer: answer);
  }

  postApplication() async {
    httpService.postApplication(widget.event.title, application).then((value)
    {
    if(value){
        Fluttertoast.showToast(
        msg: "Etkinliğe başarıyla kaydoldunuz, detaylar mail adresinize iletilmiştir.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }else{
      Fluttertoast.showToast(
          msg: "Bir hata oluştu. Lütfen bilgileri kontrol edin.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    Navigator.pop(context);
  }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Card(
                child: Column(children: <Widget>[
                  Image(
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
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                              ))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                "Etkinlik Tarihi: " +
                                    widget.event.startDate +
                                    " - " +
                                    widget.event.endDate,
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                              ))
                        ],
                      )),
                  RoundedProgressBar(
                      childLeft: Text(
                          "Kontenjan durumu: " +
                              widget.event.attendantNumber.toString() +
                              "/" +
                              widget.event.quota.toString(),
                          style: TextStyle(color: Colors.white)),
                      percent: (widget.event.attendantNumber / widget.event.quota) * 100,
                      theme: RoundedProgressBarTheme.blue),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                              child: Text(
                                "Hemen Başvurun",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                        onChanged: (text) {
                          handleInputChange(text, "name");
                        },
                        keyboardType: TextInputType.text, // se secure text for passwords.
                        decoration: new InputDecoration(labelText: 'Adınız')),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                        onChanged: (text) {
                          handleInputChange(text, "surname");
                        },
                        keyboardType: TextInputType.text, // Use secure text for passwords.
                        decoration: new InputDecoration(labelText: 'Soy adınız')),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                        onChanged: (text) {
                          handleInputChange(text, "idNumber");
                        },
                        maxLength: 11,
                        keyboardType:
                        TextInputType.number, // Use secure text for passwords.
                        decoration:
                        new InputDecoration(labelText: 'T.C. Kimlik Numaranız')),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: TextFormField(
                        onChanged: (text) {
                          handleInputChange(text, "email");
                        },
                        keyboardType:
                        TextInputType.emailAddress, // Use secure text for passwords.
                        decoration: new InputDecoration(labelText: 'Email Adresiniz')),
                  ),
                  for (int i = 0; i < widget.event.customAttributes.length; i++)
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: TextFormField(
                          onChanged: (text) {
                            handleCustomAttributeChange(
                                widget.event.customAttributes[i].question, widget.event.customAttributes[i].type, text,
                                i);
                          },
                          keyboardType: widget.event.customAttributes[i].type == "text"
                              ? TextInputType.text
                              : widget.event.customAttributes[i].type == "number"
                              ? TextInputType.number
                              : TextInputType
                              .datetime, // Use secure text for passwords.
                          decoration: new InputDecoration(labelText: widget.event.customAttributes[i].question)),
                    ),
                  RaisedButton(
                    child: Text(
                      "Etkinliğe Başvur",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      postApplication();
                    },
                  ),
                ]))));
  }
}
