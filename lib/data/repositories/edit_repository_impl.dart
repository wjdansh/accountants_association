import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/core/error/failures.dart';
import 'package:accountants_association/data/model/editAccount_request_model.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';

import 'package:accountants_association/domain/entities/user_info.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/editAccount_repository.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/edit_remote_data_source.dart';
import '../datasources/login_remote_data_source.dart';
import '../model/login_request_model.dart';

class EditRepositoryImpl implements editAccountRepository {
  final editRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  EditRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, AccountTree>> editAccountInfo(
      Map<String, dynamic> editinfo) async {
    try {
      final userInfo = await remoteDataSource.editAccountInfo(editinfo);
      return Right(userInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(ServerFailure(
          message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
    }
  }
}
