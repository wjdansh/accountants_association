import 'package:accountants_association/data/model/save_tree_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/add_accounts_repository.dart';

class GetSavedTree implements UseCase<String, Params> {
  final AddAccountsRepository repository;

  GetSavedTree({required this.repository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
    return await repository.saveAccountTree(params.accounts);
  }
}

class Params extends Equatable {
  SaveTreeRequestModel accounts;

  Params({required this.accounts});

  @override
  List<Object> get props => [accounts];
}
