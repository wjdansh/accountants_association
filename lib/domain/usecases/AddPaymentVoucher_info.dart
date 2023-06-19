import 'package:accountants_association/data/repositories/simple_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/add_bondOfArrest_repository.dart';

class AddPaymentVouchersInfo implements UseCase<SimpleResponseModel, Params> {
  final AddbondOfArrestRepository? repository;

  AddPaymentVouchersInfo({this.repository});

  @override
  Future<Either<Failure, SimpleResponseModel>> call(Params params) async {
    return await repository!.PaymentVouchersInfo(params.vinfo);
  }
}

class Params extends Equatable {
  Map<String, dynamic> vinfo;

  Params({required this.vinfo});

  @override
  List<Object> get props => [vinfo];
}
