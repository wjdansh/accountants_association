import 'package:accountants_association/data/model/final_account_type_model.dart';
import 'package:accountants_association/domain/entities/final_account_type.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/model/save_tree_request_model.dart';
import '../entities/account_tree.dart';

abstract class AddAccountsRepository {
  Future<Either<Failure, List<FinalAccountType>>> getFinalAccountTypes();
  Future<Either<Failure, String>> saveAccountTree(
      SaveTreeRequestModel newAccounts);
}
