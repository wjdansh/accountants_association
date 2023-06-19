import '../../domain/entities/TempAccount.dart';

class TempAccountModel extends tempAccount {
  TempAccountModel({
    required this.id,
  });

  int? id;

  factory TempAccountModel.fromJson(Map<String, dynamic> json) =>
      TempAccountModel(
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
      };
}
