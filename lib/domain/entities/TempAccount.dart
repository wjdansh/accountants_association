import 'package:equatable/equatable.dart';

class tempAccount extends Equatable {
  int? id;

  tempAccount({this.id});

  @override
  List<Object?> get props => [id];
}
