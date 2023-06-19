import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(email: json['Email'], password: json['Password']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    data['Password'] = password;
    return data;
  }

  @override
  List<Object?> get props => [email, password];
}
