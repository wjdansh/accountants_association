import 'package:accountants_association/domain/entities/final_account_type.dart';
import 'package:accountants_association/domain/repositories/add_accounts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/add_bondOfArrest_repository.dart';

class GetAccountTypes implements UseCase<List<FinalAccountType>, NoParams> {
  final AddbondOfArrestRepository repository;

  GetAccountTypes({required this.repository});

  @override
  Future<Either<Failure, List<FinalAccountType>>> call(
      NoParams noParams) async {
    print("hey 1155");
    return await repository.getAccountTypes();
  }
}
