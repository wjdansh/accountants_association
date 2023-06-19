import 'dart:convert';

import 'package:accountants_association/domain/entities/final_account_type.dart';

FinalAccountTypeModel accountTreeModelFromJson(String str) =>
    FinalAccountTypeModel.fromJson(json.decode(str));

String accountTreeModelToJson(FinalAccountTypeModel data) =>
    json.encode(data.toJson());

class FinalAccountTypeModel extends FinalAccountType {
  FinalAccountTypeModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory FinalAccountTypeModel.fromJson(Map<String, dynamic> json) {
    return FinalAccountTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  List<FinalAccountTypeModel> listFromJson(List<dynamic> json) {
    // print("fetch list final types $json");
    return json == null
        ? <FinalAccountTypeModel>[]
        : json.map((value) => FinalAccountTypeModel.fromJson(value)).toList();
  }
}
