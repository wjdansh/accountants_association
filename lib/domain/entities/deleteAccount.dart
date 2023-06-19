import 'package:equatable/equatable.dart';

import '../../data/model/DeleteModel.dart';
import '../../data/model/tempAccountModel.dart';

class DeleteModel extends Equatable {
  DeleteModel({
    required this.userId,
    required this.tempAccount,
  });

  String userId;
  TempAccountModel tempAccount;

  List<Object?> get props => [
        userId,
        tempAccount,
      ];
}
