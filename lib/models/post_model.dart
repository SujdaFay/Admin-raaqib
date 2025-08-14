// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String id;
  final String uid;
  final String name;
  final String userProfile;
  final String title;
  final String desc;
  final String type;
  final String prTaype;
  final String location;
  final Map<String, dynamic>? details;
  final List<String> imgs;
  final DateTime date;
  final DateTime exdate;
  final double price;
  final String video;
  final bool suspend;
  PostModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.userProfile,
    required this.title,
    required this.desc,
    required this.type,
    required this.prTaype,
    required this.location,
    required this.details,
    required this.imgs,
    required this.date,
    required this.exdate,
    required this.price,
    required this.video,
    required this.suspend,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'uid': uid,
      'name': name,
      'userProfile': userProfile,
      'title': title,
      'desc': desc,
      'type': type,
      'prTaype': prTaype,
      'details': details,
      'imgs': imgs,
      'location': location,
      'date': date.toIso8601String(),
      'exdate': exdate.toIso8601String(),
      'price': price,
      'video': video,
      'suspend': suspend,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['_id'] as String,
      uid: map['uid'] as String,
      name: map['name'] as String,
      location: map['location'] as String,
      userProfile: map['userProfile'] ?? "",
      title: map['title'] as String,
      desc: map['desc'] as String,
      type: map['type'] as String,
      prTaype: map['prTaype'] as String,
      video: map['video'] as String,
      details: map['details'] as Map<String, dynamic>,
      imgs: List<String>.from(map['imgs'] as List),
      date: DateTime.parse(map['date']),
      exdate: DateTime.parse(map['exdate']),
      price: (map['price'] as num).toDouble(),
      suspend: (map['suspend'] as bool),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
