import 'dart:math';

import 'package:accountants_association/core/base/model/service_response_model.dart';
import 'package:accountants_association/core/error/exceptions.dart';
import 'package:accountants_association/data/model/user_info_model.dart';
import 'package:accountants_association/data/model/vouchersModel.dart';
import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/domain/entities/vouchers.dart';

import '../../core/base/model/enums/service_path.dart';
import '../../core/base/service/base_servrice.dart';
import '../model/accountTree_model.dart';

abstract class voucherRemoteDataSource {
  Future<vouchers> ReceiptVouchersInfo(Map<String, dynamic> vouch);
  Future<vouchers> PaymentVouchersInfo(Map<String, dynamic> vouch);
  Future<vouchers> RestrictionVouchersInfo(Map<String, dynamic> vouch);
}

class voucherRemoteDataSourceImpl implements voucherRemoteDataSource {
  @override
  Future<vouchers> ReceiptVouchersInfo(Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddReceiptVouchers.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : VouchersModel.fromJson(response.obj);
  }

  Future<vouchers> PaymentVouchersInfo(Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddPaymentVouchers.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : VouchersModel.fromJson(response.obj);
  }

  Future<vouchers> RestrictionVouchersInfo(Map<String, dynamic> vouch) async {
    final response = await BaseService()
        .postRequest(ServicePath.AddRestrictionVoucher.getPath, vouch);
    return response.hasError
        ? throw ResponseException(message: response.error ?? "")
        : VouchersModel.fromJson(response.obj);
  }
}
