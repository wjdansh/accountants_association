import 'package:accountants_association/core/error/exceptions.dart';
import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';

import '../model/accountTree_model.dart';
import '../repositories/simple_response_model.dart';

abstract class AccountSavedTreeRemoteDataSource {
  Future<List<AccountTreeModel>> getTransferredAccountsTree(
      Map<String, dynamic> account);
  Future<List<AccountTreeModel>> transferredAccountsTree(
      Map<String, dynamic> account);

  Future<SimpleResponseModel> deleteAccount(Map<String, dynamic> account);
}

class AccountSavedTreeRemoteDataSourceImpl
    implements AccountSavedTreeRemoteDataSource {
  @override
  Future<List<AccountTreeModel>> getTransferredAccountsTree(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.getAccountSavedTree.getPath, account);
    // print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountTreeModel().listFromJson(response.obj);
  }

  @override
  Future<List<AccountTreeModel>> transferredAccountsTree(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.transferredAccountsTree.getPath, account);
    //print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountTreeModel().listFromJson(response.obj);
  }

  @override
  Future<SimpleResponseModel> deleteAccount(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.deleteAccount.getPath, account);
    print("SS ${response}");

    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : SimpleResponseModel.fromJson(response.obj);
  }
}
