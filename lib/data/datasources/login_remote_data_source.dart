import 'dart:math';

import 'package:accountants_association/core/base/model/service_response_model.dart';
import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/data/model/user_info_model.dart';

import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';

abstract class LoginRemoteDataSource {
  Future<UserInfoModel> getUserInfo(Map<String, dynamic> user);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<UserInfoModel> getUserInfo(Map<String, dynamic> user) async {
    final response =
        await BaseService().postRequest(ServicePath.login.getPath, user);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : UserInfoModel.fromJson(response.obj);
  }
}
