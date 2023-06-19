import 'package:equatable/equatable.dart';

class AccountInfo extends Equatable {
  int? accountNumber;
  String? accountName;
  int? accountID;
  String? taxNumber;

  AccountInfo({this.accountNumber, this.accountName, this.accountID, this.taxNumber});

  @override
  List<Object?> get props => [
        accountNumber,
        accountName,
        accountID,
        taxNumber,
      ];
}
