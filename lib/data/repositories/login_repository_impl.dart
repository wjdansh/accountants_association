import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/core/error/failures.dart';

import 'package:accountants_association/domain/entities/user_info.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_data_source.dart';
import '../model/login_request_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserInfo>> getUserInfo(LoginRequestModel user) async {
    try {
      final userInfo = await remoteDataSource.getUserInfo(user.toJson());
      return Right(userInfo);
    } on ResponseException catch (e) {
      return Left(ResponseFailure(message: e.message));
    } catch (e) {
      print("catching ${e.toString()}");
      return Left(
          ServerFailure(message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
    }
  }
}
