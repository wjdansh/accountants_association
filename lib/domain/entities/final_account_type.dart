import 'package:equatable/equatable.dart';

class FinalAccountType extends Equatable {
  int? id;
  String? name;

  FinalAccountType({this.id, this.name});

  @override
  List<Object?> get props => [id, name];
}
