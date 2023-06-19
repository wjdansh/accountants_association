import 'package:equatable/equatable.dart';

class AccountNumType extends Equatable {
  int? accountNumber;

  AccountNumType({this.accountNumber});

  @override
  List<Object?> get props => [accountNumber];
}
