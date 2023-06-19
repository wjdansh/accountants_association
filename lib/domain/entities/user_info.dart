import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  String userId;
  String userName;
  String expiryDate;
  String cookies;

  UserInfo(
      {required this.userId,
      required this.userName,
      required this.expiryDate,
      required this.cookies});

  @override
  List<Object?> get props => [userId, userName, expiryDate, cookies];
}
