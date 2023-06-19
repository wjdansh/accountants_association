import 'package:equatable/equatable.dart';

class UserIdModel extends Equatable {
  String userId;

  UserIdModel({required this.userId});

  factory UserIdModel.fromJson(Map<String, dynamic> json) =>
      UserIdModel(userId: json['id']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = userId;
    return data;
  }

  @override
  List<Object?> get props => [userId];
}
