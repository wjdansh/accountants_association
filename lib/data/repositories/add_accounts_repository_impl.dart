import 'package:accountants_association/data/datasources/add_accounts_remote_data_source.dart';
import 'package:accountants_association/data/model/final_account_type_model.dart';

import 'package:accountants_association/domain/repositories/add_accounts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/final_account_type.dart';
import '../model/save_tree_request_model.dart';

class AddAccountsRepositoryImpl extends AddAccountsRepository {
  final AddAccountsRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  AddAccountsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<FinalAccountType>>> getFinalAccountTypes() async {
    try {
      final finalAccountTypes = await remoteDataSource.getFinalAccountTypes();
      return Right(finalAccountTypes);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Future<Either<Failure, String>> saveAccountTree(
      SaveTreeRequestModel newAccounts) async {
    try {
      final savedAccountTree =
          await remoteDataSource.saveAccountTree(newAccounts.toJson());
      print("repoo $savedAccountTree");
      return Right(savedAccountTree.message!);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
    }
  }
}
