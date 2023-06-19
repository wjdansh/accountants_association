import 'package:accountants_association/data/model/accountTree_model.dart';
import 'package:accountants_association/data/model/login_request_model.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/entities/user_info.dart';
import 'package:accountants_association/domain/entities/vouchers.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../data/model/editAccount_request_model.dart';

abstract class voucherRepository {
  Future<Either<Failure, String>> voucherInfo(Map<String, dynamic> vouchinfo);
}
