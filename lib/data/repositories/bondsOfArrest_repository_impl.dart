import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/core/error/failures.dart';
import 'package:accountants_association/data/datasources/accountTree_remote_data_source.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/entities/bondsOfArrestEinfo.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/bondsOfArrest_repository.dart';
import '../datasources/bondOfArrest_remote_data_source.dart';

class bondsOfArrestRepositoryImpl implements bondsOfArrestRepository {
  final bondsOfArrestRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  bondsOfArrestRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<bondsOfArrestEInfo>>> getbondsOfArrest(
      Map<String, dynamic> account) async {
    try {
      final accountInfo = await remoteDataSource.getbondsOfArrest(account);
      print("in repository accountInfo is: ${accountInfo.toString()}");
      return Right(accountInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<bondsOfArrestEInfo>>> getPaymentVouchers(
      Map<String, dynamic> account) async {
    try {
      final accountInfo = await remoteDataSource.getPaymentVouchers(account);
      print("in repository accountInfo is: ${accountInfo.toString()}");
      return Right(accountInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<bondsOfArrestEInfo>>> getRestrictionVoucher(
      Map<String, dynamic> account) async {
    try {
      final accountInfo = await remoteDataSource.getRestrictionVoucher(account);
      print("in repository accountInfo is: ${accountInfo.toString()}");
      return Right(accountInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
