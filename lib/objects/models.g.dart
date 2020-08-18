// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      quota: json['quota'] as int,
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble(),
      customAttributes: (json['customAttributes'] as List)
          ?.map((e) => e == null
              ? null
              : CustomAttribute.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      attendantNumber: json['attendantNumber'] as int,
      managerName: json['managerName'] as String,
      questionUrl: json['questionUrl'] as String,
      endDateValid: json['endDateValid'] as bool);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'quota': instance.quota,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'customAttributes':
          instance.customAttributes?.map((e) => e?.toJson())?.toList(),
      'attendantNumber': instance.attendantNumber,
      'managerName': instance.managerName,
      'questionUrl': instance.questionUrl,
      'endDateValid': instance.endDateValid
    };

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) {
  return CustomAttribute(
      question: json['question'] as String,
      type: json['type'] as String,
      typeValid: json['typeValid'] as bool);
}

Map<String, dynamic> _$CustomAttributeToJson(CustomAttribute instance) =>
    <String, dynamic>{
      'question': instance.question,
      'type': instance.type,
      'typeValid': instance.typeValid
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
      idNumber: json['idNumber'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      applicationCustomAttributes: (json['applicationCustomAttributes'] as List)
          ?.map((e) => e == null
              ? null
              : ApplicationCustomAttribute.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'idNumber': instance.idNumber,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'applicationCustomAttributes': instance.applicationCustomAttributes
          ?.map((e) => e?.toJson())
          ?.toList()
    };

ApplicationCustomAttribute _$ApplicationCustomAttributeFromJson(
    Map<String, dynamic> json) {
  return ApplicationCustomAttribute(
      question: json['question'] as String,
      type: json['type'] as String,
      answer: json['answer'] as String);
}

Map<String, dynamic> _$ApplicationCustomAttributeToJson(
        ApplicationCustomAttribute instance) =>
    <String, dynamic>{
      'question': instance.question,
      'type': instance.type,
      'answer': instance.answer
    };
