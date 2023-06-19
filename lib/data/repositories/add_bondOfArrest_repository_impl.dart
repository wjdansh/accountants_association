import 'package:accountants_association/data/datasources/add_accounts_remote_data_source.dart';
import 'package:accountants_association/data/model/final_account_type_model.dart';
import 'package:accountants_association/data/model/vouchersModel.dart';
import 'package:accountants_association/data/repositories/simple_response_model.dart';

import 'package:accountants_association/domain/repositories/add_accounts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/accountNum_type.dart';
import '../../domain/entities/client_account.dart';
import '../../domain/entities/final_account_type.dart';
import '../../domain/repositories/add_bondOfArrest_repository.dart';
import '../datasources/add_bondOfArrest_remote_data_source.dart';
import '../model/save_tree_request_model.dart';
import '../model/user_id_model.dart';

class AddbondOfArrestRepositoryImpl extends AddbondOfArrestRepository {
  final AddbondOfArrestRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  AddbondOfArrestRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<FinalAccountType>>> getAccountTypes() async {
    try {
      final AccountTypes = await remoteDataSource.getAccountTypes();
      return Right(AccountTypes);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى 1"));
    }
  }

  @override
  // Future<Either<Failure, String>> saveBondOfArrest(
  //     VouchersModel Vouchers) async {
  //   try {
  //     final savedVoucher =
  //         await remoteDataSource.ReceiptVouchersInfo(Vouchers.toJson());
  //     print("repoo $savedVoucher");
  //     return Right(savedVoucher.message!);
  //   } on ResponseException catch (e) {
  //     return Left(ResponseFailure(message: e.message));
  //   } catch (e) {
  //     return Left(ServerFailure(
  //         message: " خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى "));
  //   }
  // }

  @override
  Future<Either<Failure, SimpleResponseModel>> ReceiptVouchersInfo(
      Map<String, dynamic> vouchinfo) async {
    try {
      final vouInfo = await remoteDataSource.ReceiptVouchersInfo(vouchinfo);
      return Right(vouInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى "));
    }
  }

  Future<Either<Failure, SimpleResponseModel>> PaymentVouchersInfo(
      Map<String, dynamic> vouchinfo) async {
    try {
      final vouInfo = await remoteDataSource.PaymentVouchersInfo(vouchinfo);
      return Right(vouInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى "));
    }
  }

  Future<Either<Failure, SimpleResponseModel>> RestrictionVouchersInfo(
      Map<String, dynamic> vouchinfo) async {
    try {
      final vouInfo = await remoteDataSource.RestrictionVouchersInfo(vouchinfo);
      return Right(vouInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى "));
    }
  }

  Future<Either<Failure, List<AccountInfo>>> getAccountsInfo(
      UserIdModel userId) async {
    try {
      final accountsDataInfo =
          await remoteDataSource.getAccountsInfo(userId.toJson());
      return Right(accountsDataInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
    }
  }
}
