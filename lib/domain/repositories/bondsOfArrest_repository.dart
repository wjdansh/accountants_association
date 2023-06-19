import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/bondsOfArrestEinfo.dart';

abstract class bondsOfArrestRepository {
  Future<Either<Failure, List<bondsOfArrestEInfo>>> getbondsOfArrest(
      Map<String, dynamic> bond);
  Future<Either<Failure, List<bondsOfArrestEInfo>>> getPaymentVouchers(
      Map<String, dynamic> bond);
  Future<Either<Failure, List<bondsOfArrestEInfo>>> getRestrictionVoucher(
      Map<String, dynamic> bond);
}
