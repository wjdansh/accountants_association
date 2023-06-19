import 'package:accountants_association/data/model/vouchersModel.dart';
import 'package:accountants_association/data/repositories/simple_response_model.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/entities/vouchers.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../data/model/editAccount_request_model.dart';
import '../repositories/add_bondOfArrest_repository.dart';
import '../repositories/editAccount_repository.dart';
import '../repositories/vouchers_repository.dart';

class AddRestrictionVoucherInfo
    implements UseCase<SimpleResponseModel, Params> {
  final AddbondOfArrestRepository? repository;

  AddRestrictionVoucherInfo({this.repository});

  @override
  Future<Either<Failure, SimpleResponseModel>> call(Params params) async {
    return await repository!.RestrictionVouchersInfo(params.vinfo);
  }
}

class Params extends Equatable {
  Map<String, dynamic> vinfo;

  Params({required this.vinfo});

  @override
  List<Object> get props => [vinfo];
}
