import 'package:equatable/equatable.dart';

class TreeAccount extends Equatable {
  String accountNumber;
  String accountName;
  String finalAccount;
  String? taxNumber;
  String? commercialRegister;

  TreeAccount(
      {required this.accountNumber,
      required this.accountName,
      required this.finalAccount,
      this.taxNumber,
      this.commercialRegister});

  @override
  List<Object?> get props => [
        accountNumber,
        accountName,
        finalAccount,
        taxNumber,
        commercialRegister,
      ];
}
