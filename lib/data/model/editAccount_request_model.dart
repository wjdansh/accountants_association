import 'package:accountants_association/data/model/accountTree_model.dart';
import 'package:accountants_association/domain/entities/pre_tree_account.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/final_account_type.dart';

class editAccountRequestModel extends PreTreeAccount {
  int? id;
  int? AccountNumber;
  String? AccountName;
  FinalAccountType? FinalAccount;
  double? Creditor;
  double? Debtor;
  String? TaxNumber;
  String? CommercialRegister;

  editAccountRequestModel(
      {this.id,
      this.AccountNumber,
      this.AccountName,
      this.FinalAccount,
      this.Creditor,
      this.Debtor,
      this.TaxNumber,
      this.CommercialRegister})
      : super(
          accountNumber: AccountNumber!,
          accountName: AccountName!,
          finalAccount: FinalAccount,
          taxNumber: TaxNumber,
          commercialRegister: CommercialRegister,
        );

  factory editAccountRequestModel.fromJson(Map<String, dynamic> json) =>
      editAccountRequestModel(
          id: json['ID'],
          AccountNumber: json['AccountNumber'],
          AccountName: json['AccountName'],
          FinalAccount: json['FinalAccount'],
          Creditor: json['Creditor'],
          Debtor: json['Debtor'],
          TaxNumber: json['TaxNumber'],
          CommercialRegister: json['CommercialRegister']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = id;
    data['AccountNumber'] = AccountNumber;
    data['AccountName'] = AccountName;
    data['FinalAccount'] = FinalAccount;
    data['Creditor'] = Creditor;
    data['Debtor'] = Debtor;
    data['TaxNumber'] = TaxNumber;
    data['CommercialRegister'] = CommercialRegister;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        AccountNumber,
        AccountName,
        FinalAccount,
        Creditor,
        Debtor,
        TaxNumber,
        CommercialRegister
      ];
}
