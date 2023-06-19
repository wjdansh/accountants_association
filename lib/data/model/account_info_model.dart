import '../../domain/entities/client_account.dart';

class AccountInfoModel extends AccountInfo {
  AccountInfoModel(
      {int? accountNumber, String? accountName, int? accountID, String? taxNumber})
      : super(
            accountNumber: accountNumber,
            accountName: accountName,
            accountID: accountID,
            taxNumber: taxNumber);

  AccountInfoModel.fromJson(Map<String, dynamic> json) {
    accountNumber = json['accountNumber'];
    accountName = json['accountName'];
    accountID = json['id'];
    taxNumber = json['taxNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accountNumber'] = accountNumber;
    data['accountName'] = accountName;
    data['id'] = accountID;
    data['taxNumber'] = taxNumber;
    return data;
  }

  List<AccountInfoModel> listFromJson(List<dynamic> json) {
    return json == null
        ? <AccountInfoModel>[]
        : json.map((value) => AccountInfoModel.fromJson(value)).toList();
  }
}
