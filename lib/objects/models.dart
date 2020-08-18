
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable(explicitToJson: true)
class Event {
  final String title;
  final String description;
  final String image;
  final String startDate;
  final String endDate;
  final int quota;
  final double latitude;
  final double longitude;
  final List<CustomAttribute> customAttributes;
  final int attendantNumber;
  final String managerName;
  final String questionUrl;
  final bool endDateValid;

  Event({
      this.title,
      this.description,
      this.image,
      this.startDate,
      this.endDate,
      this.quota,
      this.latitude,
      this.longitude,
      this.customAttributes,
      this.attendantNumber,
      this.managerName,
      this.questionUrl,
      this.endDateValid});


  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CustomAttribute{
  final String question;
  final String type;
  final bool typeValid;

  CustomAttribute({this.question, this.type, this.typeValid});

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => _$CustomAttributeFromJson(json);
  Map<String, dynamic> toJson() => _$CustomAttributeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Application{

  String idNumber;
   String email;
   String name;
   String surname;
   List<ApplicationCustomAttribute> applicationCustomAttributes = List();

  Application({this.idNumber, this.email, this.name, this.surname,
      this.applicationCustomAttributes});


  void assignProperty(String key, dynamic value) {
  switch(key) {
  case 'idNumber':  idNumber = value; break;
  case 'email':  email = value; break;
  case 'name':  name = value; break;
  case 'surname':  surname = value; break;
  case 'applicationCustomAttributes':  applicationCustomAttributes = value; break;
  }
  }

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

}

@JsonSerializable(explicitToJson: true)
class ApplicationCustomAttribute{
   String question;
   String type;
   String answer;

  ApplicationCustomAttribute({this.question, this.type, this.answer});

  void assignProperty(String key, dynamic value) {
  switch(key) {
  case 'question': question = value; break;
  case 'type': type = value; break;
  case 'answer': answer = value; break;
  }
  }


  factory ApplicationCustomAttribute.fromJson(Map<String, dynamic> json) => _$ApplicationCustomAttributeFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationCustomAttributeToJson(this);
}

