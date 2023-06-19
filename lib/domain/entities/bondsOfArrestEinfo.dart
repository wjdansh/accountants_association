import 'package:equatable/equatable.dart';

class bondsOfArrestEInfo extends Equatable {
  bondsOfArrestEInfo({
    this.date,
    this.receiotAccount,
    this.information,
    this.payerName,
    this.payerNumber,
    this.serviceName,
    this.serviceNumber,
    this.value,
    this.description,
  });

  String? date;
  String? receiotAccount;
  dynamic information;
  String? payerName;
  int? payerNumber;
  String? serviceName;
  int? serviceNumber;
  int? value;
  dynamic description;

  @override
  List<Object?> get props => [
        date,
        receiotAccount,
        information,
        payerName,
        payerNumber,
        serviceName,
        serviceNumber,
        value,
        description,
      ];
}
