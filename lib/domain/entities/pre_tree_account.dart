import 'package:equatable/equatable.dart';

import '../../data/model/accountTree_model.dart';
import 'final_account_type.dart';

class PreTreeAccount extends Equatable {
  int accountNumber;
  String accountName;
  FinalAccountType? finalAccount;
  String? taxNumber;
  String? commercialRegister;

  PreTreeAccount(
      {required this.accountNumber,
      required this.accountName,
      this.finalAccount,
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
