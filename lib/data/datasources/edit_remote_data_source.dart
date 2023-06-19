import 'dart:math';

import 'package:accountants_association/core/base/model/service_response_model.dart';
import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/data/model/user_info_model.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';

import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';
import '../model/accountTree_model.dart';

abstract class editRemoteDataSource {
  Future<AccountTree> editAccountInfo(Map<String, dynamic> user);
}

class editRemoteDataSourceImpl implements editRemoteDataSource {
  @override
  Future<AccountTree> editAccountInfo(Map<String, dynamic> edit) async {
    final response =
        await BaseService().postRequest(ServicePath.editAccount.getPath, edit);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : AccountTreeModel.fromJson(response.obj);
  }
}
