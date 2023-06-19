import 'package:accountants_association/data/model/user_id_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';

import '../entities/client_account.dart';
import '../repositories/add_bondOfArrest_repository.dart';

class GetAccountsDataInfo
    implements UseCase<List<AccountInfo>, AccountDataParams> {
  final AddbondOfArrestRepository repository;

  GetAccountsDataInfo({required this.repository});

  @override
  Future<Either<Failure, List<AccountInfo>>> call(
      AccountDataParams params) async {
    return await repository.getAccountsInfo(params.userId);
    // return params.isNumber
    //     ? await repository.getClientAccountName(params.clientInfo)
    //     : await repository.getClientAccountNumber(params.clientInfo);
  }
}

class AccountDataParams extends Equatable {
  final UserIdModel userId;

  const AccountDataParams({required this.userId});

  @override
  List<Object> get props => [userId];
}
