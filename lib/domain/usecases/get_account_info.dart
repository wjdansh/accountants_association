import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';

class GetAccountInfo implements UseCase<List<AccountTree>, Param> {
  final accountTreeRepository repository;

  GetAccountInfo(this.repository);

  @override
  Future<Either<Failure, List<AccountTree>>> call(Param param) async {
    return await repository.getTransferredAccountsTree(param.account);
  }
}

class Param extends Equatable {
  Map<String, dynamic> account;

  Param({required this.account});

  @override
  List<Object> get props => [account];
}
