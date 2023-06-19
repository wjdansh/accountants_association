import 'dart:convert';

import 'package:accountants_association/domain/entities/bondsOfArrestEinfo.dart';

BondsOfArrestModel bondsOfArrestModelFromJson(String str) =>
    BondsOfArrestModel.fromJson(json.decode(str));

String bondsOfArrestModelToJson(BondsOfArrestModel data) =>
    json.encode(data.toJson());

class BondsOfArrestModel extends bondsOfArrestEInfo {
  BondsOfArrestModel({
    this.date,
    this.receiotAccount,
    this.information,
    this.payerName,
    this.payerNumber,
    this.serviceName,
    this.serviceNumber,
    this.value,
    this.description,
  });

  String? date;
  String? receiotAccount;
  dynamic information;
  String? payerName;
  int? payerNumber;
  String? serviceName;
  int? serviceNumber;
  int? value;
  dynamic description;

  factory BondsOfArrestModel.fromJson(Map<String, dynamic> json) =>
      BondsOfArrestModel(
        date: json["date"] == null ? null : json["date"],
        receiotAccount:
            json["receiotAccount"] == null ? null : json["receiotAccount"],
        information: json["information"] == null ? null : json["information"],
        payerName: json["payerName"] == null ? null : json["payerName"],
        payerNumber: json["payerNumber"] == null ? null : json["payerNumber"],
        serviceName: json["serviceName"] == null ? null : json["serviceName"],
        serviceNumber:
            json["serviceNumber"] == null ? null : json["serviceNumber"],
        value: json["value"] == null ? null : json["value"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "receiotAccount": receiotAccount == null ? null : receiotAccount,
        "information": information == null ? null : information,
        "payerName": payerName == null ? null : payerName,
        "payerNumber": payerNumber == null ? null : payerNumber,
        "serviceName": serviceName == null ? null : serviceName,
        "serviceNumber": serviceNumber == null ? null : serviceNumber,
        "value": value == null ? null : value,
        "description": description == null ? null : description,
      };

  List<BondsOfArrestModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <BondsOfArrestModel>[]
        : json.map((value) => BondsOfArrestModel.fromJson(value)).toList();
  }
}
