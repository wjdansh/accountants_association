import 'package:accountants_association/data/model/final_account_type_model.dart';
import 'package:accountants_association/data/repositories/simple_response_model.dart';
import 'package:accountants_association/domain/entities/final_account_type.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/model/save_tree_request_model.dart';
import '../../data/model/user_id_model.dart';
import '../../data/model/vouchersModel.dart';
import '../entities/accountNum_type.dart';
import '../entities/account_tree.dart';
import '../entities/client_account.dart';

abstract class AddbondOfArrestRepository {
  Future<Either<Failure, List<FinalAccountType>>> getAccountTypes();

  Future<Either<Failure, SimpleResponseModel>> ReceiptVouchersInfo(
      Map<String, dynamic> vouchinfo);
  Future<Either<Failure, SimpleResponseModel>> PaymentVouchersInfo(
      Map<String, dynamic> vouchinfo);
  Future<Either<Failure, SimpleResponseModel>> RestrictionVouchersInfo(
      Map<String, dynamic> vouchinfo);
  Future<Either<Failure, List<AccountInfo>>> getAccountsInfo(
      UserIdModel userId);
}
