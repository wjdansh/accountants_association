import 'package:accountants_association/domain/entities/final_account_type.dart';
import 'package:accountants_association/domain/repositories/add_accounts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';

class GetFinalAccountTypes
    implements UseCase<List<FinalAccountType>, NoParams> {
  final AddAccountsRepository repository;

  GetFinalAccountTypes({required this.repository});

  @override
  Future<Either<Failure, List<FinalAccountType>>> call(
      NoParams noParams) async {
    return await repository.getFinalAccountTypes();
  }
}
