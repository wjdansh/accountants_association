import 'package:accountants_association/data/model/login_request_model.dart';
import 'package:accountants_association/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserInfo>> getUserInfo(LoginRequestModel user);
}
