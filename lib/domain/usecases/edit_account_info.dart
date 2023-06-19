import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/model/editAccount_request_model.dart';
import '../repositories/editAccount_repository.dart';

class editAccountInfo implements UseCase<AccountTree, Paramse> {
  final editAccountRepository repository;

  editAccountInfo(this.repository);

  @override
  Future<Either<Failure, AccountTree>> call(Paramse params) async {
    return await repository.editAccountInfo(params.edit);
  }
}

class Paramse extends Equatable {
  Map<String, dynamic> edit;

  Paramse({required this.edit});

  @override
  List<Object> get props => [edit];
}
