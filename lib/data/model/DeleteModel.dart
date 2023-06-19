import 'package:accountants_association/data/model/tempAccountModel.dart';

import 'dart:convert';

DeleteModel deleteModelFromJson(String str) =>
    DeleteModel.fromJson(json.decode(str));

String deleteModelToJson(DeleteModel data) => json.encode(data.toJson());

class DeleteModel {
  DeleteModel({
    required this.userId,
    required this.tempAccount,
  });

  String userId;
  TempAccountModel tempAccount;

  factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
        userId: json["userId"],
        tempAccount: TempAccountModel.fromJson(json["tempAccount"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "tempAccount": tempAccount.toJson(),
      };
}
