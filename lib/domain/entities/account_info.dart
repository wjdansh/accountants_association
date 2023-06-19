import 'package:equatable/equatable.dart';

class accountInfo extends Equatable {
  accountInfo({
    this.id,
    this.accountNumber,
    this.accountName,
    this.finalAccountTypes,
    this.finalAccountTypesId,
    this.creditor,
    this.debtor,
    this.taxNumber,
    this.commercialRegister,
    this.applicationUser,
    this.applicationUserId,
    this.creationDate,
  });

  int? id;
  int? accountNumber;
  String? accountName;
  dynamic finalAccountTypes;
  int? finalAccountTypesId;
  int? creditor;
  int? debtor;
  String? taxNumber;
  String? commercialRegister;
  dynamic applicationUser;
  int? applicationUserId;
  DateTime? creationDate;
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
        creationDate
      ];
}
