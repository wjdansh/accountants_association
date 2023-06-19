import 'package:accountants_association/data/model/pre_tree_account_model.dart';
import 'package:accountants_association/domain/entities/pre_tree_account.dart';
import 'package:equatable/equatable.dart';

import 'editAccount_request_model.dart';

class SaveTreeRequestModel extends Equatable {
  String userId;
  List<PreTreeAccountModel> accountsTree;

  SaveTreeRequestModel({required this.userId, required this.accountsTree});

  factory SaveTreeRequestModel.fromJson(Map<String, dynamic> json) =>
      SaveTreeRequestModel(
          userId: json['userId'], accountsTree: json['AccountTreeViewModel']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['AccountTreeViewModel'] =
        accountsTree.map((element) => element.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [userId, accountsTree];
}
