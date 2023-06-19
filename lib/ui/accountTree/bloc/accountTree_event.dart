part of 'accountTree_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class GetAccountInformation extends AccountEvent {
  String? id;

  GetAccountInformation({
    this.id,
  });
  @override
  List<Object?> get props => [];
}

class ChangeAccountNum extends AccountEvent {
  AccountTree value;
  ChangeAccountNum({required this.value});

  @override
  List<Object?> get props => [];
}
