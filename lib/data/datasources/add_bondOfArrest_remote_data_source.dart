import 'package:accountants_association/core/error/exceptions.dart';

import '../../core/base/model/enums/service_path.dart';

import '../../core/base/service/base_servrice.dart';
import '../../domain/entities/vouchers.dart';
import '../model/accountNum_type_model.dart';
import '../model/accountTree_model.dart';
import '../model/account_info_model.dart';
import '../model/final_account_type_model.dart';
import '../model/vouchersModel.dart';
import '../repositories/simple_response_model.dart';

abstract class AddbondOfArrestRemoteDataSource {
  Future<List<FinalAccountTypeModel>> getAccountTypes();
  Future<List<AccountNumTypeModel>> getAccountNumTypes();
  Future<SimpleResponseModel> ReceiptVouchersInfo(Map<String, dynamic> vouch);
  Future<SimpleResponseModel> PaymentVouchersInfo(Map<String, dynamic> vouch);
  Future<SimpleResponseModel> RestrictionVouchersInfo(
      Map<String, dynamic> vouch);
  Future<List<AccountInfoModel>> getAccountsInfo(Map<String, dynamic> userId);
}

class AddbondOfArrestRemoteDataSourceImpl
    implements AddbondOfArrestRemoteDataSource {
  @override
  Future<List<FinalAccountTypeModel>> getAccountTypes() async {
    final response =
        await BaseService().getRequest(ServicePath.AccountTypes.getPath);
    print('body ${response.obj}');

    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : FinalAccountTypeModel().listFromJson(response.obj);
  }

  Future<List<AccountNumTypeModel>> getAccountNumTypes() async {
    final response =
        await BaseService().getRequest(ServicePath.AccountTypes.getPath);
    print('body ${response.obj}');

    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountNumTypeModel().listFromJson(response.obj);
  }

  @override
  Future<List<AccountInfoModel>> getAccountsInfo(
      Map<String, dynamic> clientAccountInfo) async {
    final response = await BaseService()
        .postRequest(ServicePath.getAllAccounts.getPath, clientAccountInfo);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountInfoModel().listFromJson(response.obj);
  }

  Future<SimpleResponseModel> ReceiptVouchersInfo(
      Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddReceiptVouchers.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : SimpleResponseModel.fromJson(response.obj);
  }

  Future<SimpleResponseModel> PaymentVouchersInfo(
      Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddPaymentVouchers.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : SimpleResponseModel.fromJson(response.obj);
  }

  Future<SimpleResponseModel> RestrictionVouchersInfo(
      Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddRestrictionVoucher.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : SimpleResponseModel.fromJson(response.obj);
  }
}
