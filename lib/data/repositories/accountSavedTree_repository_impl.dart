import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/core/error/failures.dart';
import 'package:accountants_association/data/datasources/accountTree_remote_data_source.dart';
import 'package:accountants_association/data/repositories/simple_response_model.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/accountSavedTree_repository.dart';
import '../datasources/accountSavedTree_remote_data_source.dart';

class AccountSavedTreeRepositoryImpl implements accountSavedTreeRepository {
  final AccountSavedTreeRemoteDataSource? remoteDataSource;
  final AccountSavedTreeRemoteDataSource? tremoteDataSource;

  // final NetworkInfo networkInfo;

  AccountSavedTreeRepositoryImpl(
      {this.remoteDataSource, this.tremoteDataSource});

  @override
  Future<Either<Failure, List<AccountTree>>> getTransferredAccountsTree(
      Map<String, dynamic> account) async {
    try {
      final accountInfo =
          await remoteDataSource?.getTransferredAccountsTree(account);
      print("in repository accountInfo is: ${accountInfo.toString()}");
      return Right(accountInfo!);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<AccountTree>>> transferredAccountsTree(
      Map<String, dynamic> account) async {
    try {
      final accountTreeInfo =
          await tremoteDataSource?.transferredAccountsTree(account);
      print("in repository accountInfo is: ${accountTreeInfo.toString()}");
      return Right(accountTreeInfo!);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SimpleResponseModel>> deleteAccount(
      Map<String, dynamic> account) async {
    try {
      final DaccountInfo = await remoteDataSource!.deleteAccount(account);
      return Right(DaccountInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى "));
    }
  }
}
