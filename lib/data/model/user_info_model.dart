import 'package:accountants_association/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  UserInfoModel({
    String? userId,
    String? userName,
    String? expiryDate,
    String? cookies,
  }) : super(
            userId: userId!,
            userName: userName!,
            expiryDate: expiryDate!,
            cookies: cookies!);

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
        userId: json['userId'],
        userName: json['userName'],
        expiryDate: json['expiryDate'],
        cookies: json['cookies']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['userName'] = userName;
    data['expiryDate'] = expiryDate;
    data['cookies'] = cookies;
    return data;
  }
}
