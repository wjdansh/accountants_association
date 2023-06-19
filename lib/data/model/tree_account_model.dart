import 'package:accountants_association/domain/entities/tree_account.dart';

class TreeAccountModel extends TreeAccount {
  TreeAccountModel({
    String? accountNumber,
    String? accountName,
    String? finalAccount,
    String? taxNumber,
    String? commercialRegister,
  }) : super(
          accountNumber: accountNumber!,
          accountName: accountName!,
          finalAccount: finalAccount!,
          taxNumber: taxNumber,
          commercialRegister: commercialRegister,
        );

  factory TreeAccountModel.fromJson(Map<String, dynamic> json) {
    return TreeAccountModel(
        accountNumber: json['AccountNumber'],
        accountName: json['AccountName'],
        finalAccount: json['FinalAccount'],
        taxNumber: json['TaxNumber'],
        commercialRegister: json['CommercialRegister']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AccountNumber'] = accountNumber;
    data['AccountName'] = accountName;
    data['FinalAccount'] = finalAccount;
    data['TaxNumber'] = taxNumber;
    data['CommercialRegister'] = commercialRegister;
    return data;
  }
}
