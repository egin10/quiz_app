import 'package:equatable/equatable.dart';

class Topic extends Equatable {
  final String? name;

  const Topic({this.name});

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        name: json['name'],
      );

  @override
  List<Object?> get props => [name];
}
