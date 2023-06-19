import 'package:accountants_association/domain/entities/final_account_type.dart';
import 'package:accountants_association/domain/entities/pre_tree_account.dart';

class PreTreeAccountModel extends PreTreeAccount {
  PreTreeAccountModel({
    int? accountNumber,
    String? accountName,
    FinalAccountType? finalAccount,
    String? taxNumber,
    String? commercialRegister,
  }) : super(
          accountNumber: accountNumber!,
          accountName: accountName!,
          finalAccount: finalAccount!,
          taxNumber: taxNumber,
          commercialRegister: commercialRegister,
        );

  factory PreTreeAccountModel.fromJson(Map<String, dynamic> json) {
    return PreTreeAccountModel(
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
    data['FinalAccount'] = finalAccount!.id;
    data['TaxNumber'] = taxNumber;
    data['CommercialRegister'] = commercialRegister;
    return data;
  }

  List<PreTreeAccountModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <PreTreeAccountModel>[]
        : json.map((value) => PreTreeAccountModel.fromJson(value)).toList();
  }
}
