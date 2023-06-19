import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/repositories/accountTree_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/bondsOfArrestEinfo.dart';
import '../repositories/bondsOfArrest_repository.dart';

class GetPaymentVouchersInfo
    implements UseCase<List<bondsOfArrestEInfo>, params> {
  final bondsOfArrestRepository repository;

  GetPaymentVouchersInfo(this.repository);

  @override
  Future<Either<Failure, List<bondsOfArrestEInfo>>> call(params param) async {
    return await repository.getPaymentVouchers(param.bond);
  }
}

class params extends Equatable {
  Map<String, dynamic> bond;

  params({required this.bond});

  @override
  List<Object> get props => [bond];
}
