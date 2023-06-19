import 'package:accountants_association/data/repositories/simple_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/accountSavedTree_repository.dart';

class deleteAccount implements UseCase<SimpleResponseModel, deleteParams> {
  final accountSavedTreeRepository? repository;

  deleteAccount({this.repository});

  @override
  Future<Either<Failure, SimpleResponseModel>> call(deleteParams params) async {
    return await repository!.deleteAccount(params.DAccount);
  }
}

class deleteParams extends Equatable {
  Map<String, dynamic> DAccount;

  deleteParams({required this.DAccount});

  @override
  List<Object> get props => [DAccount];
}
