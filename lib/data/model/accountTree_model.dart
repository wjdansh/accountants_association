import 'package:accountants_association/domain/entities/account_tree.dart';

import 'dart:convert';

import 'final_account_type_model.dart';

AccountTreeModel accountTreeModelFromJson(String str) =>
    AccountTreeModel.fromJson(json.decode(str));

String accountTreeModelToJson(AccountTreeModel data) =>
    json.encode(data.toJson());

class AccountTreeModel extends AccountTree {
  AccountTreeModel({
    this.id,
    this.accountNumber,
    this.accountName,
    this.finalAccountType,
    this.finalAccountTypesId,
    this.creditor,
    this.debtor,
    this.taxNumber,
    this.commercialRegister,
    this.applicationUser,
    this.applicationUserId,
    this.creationDate,
    this.parentAccount,
    this.parentAccountId,
  });

  int? id;
  int? accountNumber;
  String? accountName;
  FinalAccountTypeModel? finalAccountType;
  int? finalAccountTypesId;
  double? creditor;
  double? debtor;
  String? taxNumber;
  String? commercialRegister;
  dynamic applicationUser;
  int? applicationUserId;
  DateTime? creationDate;
  dynamic parentAccount;
  dynamic parentAccountId;

  factory AccountTreeModel.fromJson(Map<String, dynamic> json) =>
      AccountTreeModel(
        id: json["id"] == null ? null : json["id"],
        accountNumber:
            json["accountNumber"] == null ? null : json["accountNumber"],
        accountName: json["accountName"] == null ? null : json["accountName"],
        finalAccountType: json["finalAccountTypes"] == null
            ? null
            : FinalAccountTypeModel.fromJson(json["finalAccountTypes"]),
        finalAccountTypesId: json["finalAccountTypesId"],
        creditor: json["creditor"] == null
            ? null
            : (json["creditor"] is double
                ? json["creditor"]
                : json["creditor"].toDouble()),
        debtor: json["debtor"] == null
            ? null
            : (json["debtor"] is double
                ? json["debtor"]
                : json["debtor"].toDouble()),
        taxNumber: json["taxNumber"],
        commercialRegister: json["commercialRegister"],
        applicationUser: json["applicationUser"],
        applicationUserId: json["applicationUserID"] == null
            ? null
            : json["applicationUserID"],
        creationDate: json["creationDate"] == null
            ? null
            : DateTime.parse(json["creationDate"]),
        parentAccount: json["parentAccount"],
        parentAccountId: json["parentAccountID"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "accountNumber": accountNumber == null ? null : accountNumber,
        "accountName": accountName == null ? null : accountName,
        "finalAccountTypes":
            finalAccountTypes == null ? null : finalAccountType!.toJson(),
        "finalAccountTypesId": finalAccountTypesId,
        "creditor": creditor == null ? null : creditor,
        "debtor": debtor == null ? null : debtor,
        "taxNumber": taxNumber,
        "commercialRegister": commercialRegister,
        "applicationUser": applicationUser,
        "applicationUserID":
            applicationUserId == null ? null : applicationUserId,
        "creationDate":
            creationDate == null ? null : creationDate!.toIso8601String(),
        "parentAccount": parentAccount,
        "parentAccountID": parentAccountId,
      };

  List<AccountTreeModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <AccountTreeModel>[]
        : json.map((value) => AccountTreeModel.fromJson(value)).toList();
  }
}

// class FinalAccountTypes extends FinalAccountType {
//   FinalAccountTypes({
//     this.id,
//     this.name,
//   });
//
//   int? id;
//   String? name;
//
//   factory FinalAccountTypes.fromJson(Map<String, dynamic> json) =>
//       FinalAccountTypes(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//       };
// }
