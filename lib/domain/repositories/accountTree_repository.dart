import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class accountTreeRepository {
  Future<Either<Failure, List<AccountTree>>> getTransferredAccountsTree(
      Map<String, dynamic> account);
}
