import 'package:accountants_association/core/error/exceptions.dart';

import '../../core/base/model/enums/service_path.dart';

import '../../core/base/service/base_servrice.dart';
import '../model/accountTree_model.dart';
import '../model/final_account_type_model.dart';
import '../repositories/simple_response_model.dart';

abstract class AddAccountsRemoteDataSource {
  Future<List<FinalAccountTypeModel>> getFinalAccountTypes();
  Future<SimpleResponseModel> saveAccountTree(
      Map<String, dynamic> accountsData);
}

class AddAccountsRemoteDataSourceImpl implements AddAccountsRemoteDataSource {
  @override
  Future<List<FinalAccountTypeModel>> getFinalAccountTypes() async {
    final response =
        await BaseService().getRequest(ServicePath.finalAccountTypes.getPath);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : FinalAccountTypeModel().listFromJson(response.obj);
  }

  @override
  Future<SimpleResponseModel> saveAccountTree(
      Map<String, dynamic> accountsData) async {
    final response = await BaseService()
        .postRequest(ServicePath.saveAccountTree.getPath, accountsData);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : SimpleResponseModel.fromJson(response.obj);
  }
}
