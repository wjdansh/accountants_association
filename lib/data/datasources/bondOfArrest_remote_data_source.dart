import 'package:accountants_association/core/error/exceptions.dart';
import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';
import '../model/accountTree_model.dart';
import '../model/bondsOfArrest_model.dart';

abstract class bondsOfArrestRemoteDataSource {
  Future<List<BondsOfArrestModel>> getbondsOfArrest(
      Map<String, dynamic> account);
  Future<List<BondsOfArrestModel>> getPaymentVouchers(
      Map<String, dynamic> account);
  Future<List<BondsOfArrestModel>> getRestrictionVoucher(
      Map<String, dynamic> account);
}

class bondsOfArrestRemoteDataSourceImpl
    implements bondsOfArrestRemoteDataSource {
  @override
  Future<List<BondsOfArrestModel>> getbondsOfArrest(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.GEtReceiptVouchers.getPath, account);
    // print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : BondsOfArrestModel().listFromJson(response.obj);
  }

  Future<List<BondsOfArrestModel>> getPaymentVouchers(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.GetPaymentVouchers.getPath, account);
    // print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : BondsOfArrestModel().listFromJson(response.obj);
  }

  Future<List<BondsOfArrestModel>> getRestrictionVoucher(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.GetRestrictionVoucher.getPath, account);
    // print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : BondsOfArrestModel().listFromJson(response.obj);
  }
}
