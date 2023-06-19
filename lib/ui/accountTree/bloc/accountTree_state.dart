part of 'accountTree_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

// class AccountInitial extends AccountState {
//   @override
//   List<Object> get props => [];
// }
class AccountInitial extends AccountState {
  List<AccountTree> Accounts;

  AccountInitial({required this.Accounts});

  @override
  List<Object> get props => [Accounts];
}

class AccountLoading extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountLoaded extends AccountState {
  final List<AccountTree> account_Info;
  const AccountLoaded({required this.account_Info});

  @override
  List<Object> get props => [account_Info];
}

class AccountModified extends AccountState {
  AccountTree accountTree;
  AccountModified({required this.accountTree});
  @override
  List<Object> get props => [];
}

class AccountError extends AccountState {
  final String message;
  const AccountError({required this.message});

  @override
  List<Object> get props => [message];
}
