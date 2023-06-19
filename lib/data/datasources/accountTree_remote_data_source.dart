import 'package:accountants_association/core/error/exceptions.dart';
import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';
import '../model/accountTree_model.dart';

abstract class AccountRemoteDataSource {
  Future<List<AccountTreeModel>> getTransferredAccountsTree(
      Map<String, dynamic> account);
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  @override
  Future<List<AccountTreeModel>> getTransferredAccountsTree(
      Map<String, dynamic> account) async {
    print("hey this $account");
    final response = await BaseService()
        .postRequest(ServicePath.getAccountTree.getPath, account);
    // print("objc= ${response.obj}");
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountTreeModel().listFromJson(response.obj);
  }
}
