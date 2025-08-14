// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MessageModel {
  final String message;
  final String id;
  final DateTime date;
  final String from;
  final String to;
  final bool read;

  MessageModel(
      {required this.id,
      required this.message,
      required this.date,
      required this.from,
      required this.to,
      required this.read});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'message': message,
      'date': date.millisecondsSinceEpoch,
      'from': from,
      'to': to,
      'read': read,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['_id'] as String,
      message: map['message'] as String,
      date: DateTime.parse(map['date']),
      from: map['from'] as String,
      to: map['to'] as String,
      read: map['read'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
