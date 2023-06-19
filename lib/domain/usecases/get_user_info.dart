import 'package:accountants_association/domain/entities/user_info.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/model/login_request_model.dart';
import '../repositories/login_repository.dart';

class GetUserInfo implements UseCase<UserInfo, Params> {
  final LoginRepository repository;

  GetUserInfo(this.repository);

  @override
  Future<Either<Failure, UserInfo>> call(Params params) async {
    return await repository.getUserInfo(params.user);
  }
}

class Params extends Equatable {
  LoginRequestModel user;

  Params({required this.user});

  @override
  List<Object> get props => [user];
}
