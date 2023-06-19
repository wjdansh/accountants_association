import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class vouchers extends Equatable {
  DateTime? date;
  String? info;
  int? accountTypeId;
  int? clientAccountId;
  int? serviceAccountId;
  int? amount;
  String? description;
  String? userId;

  vouchers({
    this.date,
    this.info,
    this.accountTypeId,
    this.clientAccountId,
    this.serviceAccountId,
    this.amount,
    this.description,
    this.userId,
  });

  @override
  List<Object?> get props => [
        date,
        info,
        accountTypeId,
        clientAccountId,
        serviceAccountId,
        description,
        amount,
        userId
      ];
}
