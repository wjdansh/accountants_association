import 'dart:convert';

import '../../domain/entities/accountNum_type.dart';

AccountNumTypeModel? accountNumTypeModelFromJson(String str) =>
    AccountNumTypeModel.fromJson(json.decode(str));

String accountNumTypeModelToJson(AccountNumTypeModel? data) =>
    json.encode(data!.toJson());

class AccountNumTypeModel extends AccountNumType {
  AccountNumTypeModel({
    this.accountNumber,
  });

  int? accountNumber;

  factory AccountNumTypeModel.fromJson(Map<String, dynamic> json) =>
      AccountNumTypeModel(
        accountNumber: json["accountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "accountNumber": accountNumber,
      };

  List<AccountNumTypeModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <AccountNumTypeModel>[]
        : json.map((value) => AccountNumTypeModel.fromJson(value)).toList();
  }
}
