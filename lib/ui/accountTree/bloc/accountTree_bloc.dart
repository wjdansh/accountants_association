import 'dart:async';

import 'package:accountants_association/domain/entities/account_tree.dart';

import 'package:accountants_association/domain/usecases/get_account_info.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failures.dart';

part 'accountTree_event.dart';
part 'accountTree_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAccountInfo getAccountInfo;

  AccountBloc({required this.getAccountInfo}) : super(AccountLoading());

  AccountState get initialState => AccountLoading();

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is GetAccountInformation) {
      yield AccountLoading();
      var accountData = {
        "id": event.id,
      };

      //    String accountData = event.id!;

      final failureOrResponse =
          await getAccountInfo(Param(account: accountData));
      yield* _eitherLoadedOrErrorState(failureOrResponse);
    } else if (event is ChangeAccountNum) {
      yield AccountModified(accountTree: event.value);
    }
  }

  Stream<AccountState> _eitherLoadedOrErrorState(
      Either<Failure, List<AccountTree>> failureOrResponse) async* {
    yield failureOrResponse.fold(
      (failure) => AccountError(message: (failure as ServerFailure).message),
      (accountInfoData) => AccountLoaded(account_Info: accountInfoData),
    );
  }
}
