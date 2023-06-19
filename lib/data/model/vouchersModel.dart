import 'dart:convert';

import 'package:accountants_association/domain/entities/vouchers.dart';

VouchersModel vouchersModelFromJson(String str) =>
    VouchersModel.fromJson(json.decode(str));

String vouchersModelToJson(VouchersModel data) => json.encode(data.toJson());

class VouchersModel extends vouchers {
  VouchersModel({
    this.date,
    this.info,
    this.accountTypeId,
    this.clientAccountId,
    this.serviceAccountId,
    this.amount,
    this.description,
    this.userId,
  });

  DateTime? date;
  String? info;
  int? accountTypeId;
  int? clientAccountId;
  int? serviceAccountId;
  int? amount;
  String? description;
  String? userId;

  factory VouchersModel.fromJson(Map<String, dynamic> json) => VouchersModel(
        date: json["Date"] == null ? null : json["Date"],
        info: json["Info"] == null ? null : json["Info"],
        accountTypeId:
            json["AccountTypeID"] == null ? null : json["AccountTypeID"],
        clientAccountId:
            json["ClientAccountID"] == null ? null : json["ClientAccountID"],
        serviceAccountId:
            json["ServiceAccountID"] == null ? null : json["ServiceAccountID"],
        amount: json["Amount"] == null ? null : json["Amount"],
        description: json["Description"] == null ? null : json["Description"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "Info": info == null ? null : info,
        "AccountTypeID": accountTypeId == null ? null : accountTypeId,
        "ClientAccountID": clientAccountId == null ? null : clientAccountId,
        "ServiceAccountID": serviceAccountId == null ? null : serviceAccountId,
        "Amount": amount == null ? null : amount,
        "Description": description == null ? null : description,
        "userId": userId == null ? null : userId,
      };
}
