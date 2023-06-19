import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/repositories/simple_response_model.dart';

abstract class accountSavedTreeRepository {
  Future<Either<Failure, List<AccountTree>>> getTransferredAccountsTree(
      Map<String, dynamic> account);
  Future<Either<Failure, List<AccountTree>>> transferredAccountsTree(
      Map<String, dynamic> account);
  Future<Either<Failure, SimpleResponseModel>> deleteAccount(
      Map<String, dynamic> account);
}
