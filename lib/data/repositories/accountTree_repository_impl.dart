import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/core/error/failures.dart';
import 'package:accountants_association/data/datasources/accountTree_remote_data_source.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';

class AccountTreeRepositoryImpl implements accountTreeRepository {
  final AccountRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  AccountTreeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<AccountTree>>> getTransferredAccountsTree(
      Map<String, dynamic> account) async {
    try {
      final accountInfo =
          await remoteDataSource.getTransferredAccountsTree(account);
      print("in repository accountInfo is: ${accountInfo.toString()}");
      return Right(accountInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
