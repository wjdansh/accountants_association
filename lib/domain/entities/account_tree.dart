import 'package:equatable/equatable.dart';

import '../../data/model/accountTree_model.dart';
import '../../data/model/final_account_type_model.dart';
import 'final_account_type.dart';

class AccountTree extends Equatable {
  AccountTree(
      {this.id,
      this.accountNumber,
      this.accountName,
      this.finalAccountTypes,
      this.finalAccountTypesId,
      this.creditor,
      this.debtor,
      this.taxNumber,
      this.commercialRegister,
      this.applicationUser,
      this.applicationUserID,
      this.creationDate,
      this.parentAccount,
      this.parentAccountID});

  int? id;
  int? accountNumber;
  String? accountName;
  FinalAccountTypeModel? finalAccountTypes;
  int? finalAccountTypesId;
  double? creditor;
  double? debtor;
  String? taxNumber;
  String? commercialRegister;
  dynamic applicationUser;
  int? applicationUserID;
  DateTime? creationDate;
  dynamic parentAccount;
  dynamic parentAccountID;

  @override
  List<Object?> get props => [
        id,
        accountNumber,
        accountName,
        finalAccountTypes,
        finalAccountTypesId,
        creditor,
        debtor,
        taxNumber,
        commercialRegister,
        applicationUser,
        applicationUserID,
        creationDate,
        parentAccount,
        parentAccountID,
      ];
}
