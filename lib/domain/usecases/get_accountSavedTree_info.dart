import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/accountSavedTree_repository.dart';

class GetAccountSavedTreeInfo implements UseCase<List<AccountTree>, Params> {
  final accountSavedTreeRepository? repository;
  final accountSavedTreeRepository? trepository;

  GetAccountSavedTreeInfo({this.repository, this.trepository});

  @override
  Future<Either<Failure, List<AccountTree>>> call(Params param) async {
    return await repository!.getTransferredAccountsTree(param.account);
  }

  Future<Either<Failure, List<AccountTree>>> callTransfer(Params param) async {
    return await trepository!.transferredAccountsTree(param.account);
  }
}

class Params extends Equatable {
  Map<String, dynamic> account;

  Params({required this.account});

  @override
  List<Object> get props => [account];
}
