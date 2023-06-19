// import 'package:accountants_association/core/error/exceptions.dart';
// import 'package:accountants_association/core/error/failures.dart';
// import 'package:accountants_association/data/model/editAccount_request_model.dart';
// import 'package:accountants_association/data/model/save_tree_request_model.dart';
// import 'package:accountants_association/domain/entities/account_tree.dart';
//
// import 'package:accountants_association/domain/entities/user_info.dart';
// import 'package:accountants_association/domain/entities/vouchers.dart';
//
// import 'package:dartz/dartz.dart';
//
// import '../../domain/entities/final_account_type.dart';
// import '../../domain/repositories/add_bondOfArrest_repository.dart';
// import '../../domain/repositories/editAccount_repository.dart';
// import '../../domain/repositories/login_repository.dart';
// import '../../domain/repositories/vouchers_repository.dart';
// import '../datasources/add_bondOfArrest_remote_data_source.dart';
// import '../datasources/edit_remote_data_source.dart';
// import '../datasources/login_remote_data_source.dart';
// import '../datasources/vouchers_remote_data_source.dart';
// import '../model/login_request_model.dart';
//
// class voucherRepositoryImpl implements AddbondOfArrestRepository {
//   final AddbondOfArrestRemoteDataSource remoteDataSource;
//
//   // final NetworkInfo networkInfo;
//
//   voucherRepositoryImpl({
//     required this.remoteDataSource,
//   });
//
//   @override
//   Future<Either<Failure, vouchers>> voucherInfo(
//       Map<String, dynamic> vouchinfo) async {
//     try {
//       final vouInfo = await remoteDataSource.ReceiptVouchersInfo(vouchinfo);
//       return Right(vouInfo);
//     } on ResponseException catch (e) {
//       return Left(ResponseFailure(message: e.message));
//     } catch (e) {
//       print("catching ${e.toString()}");
//       return Left(ServerFailure(
//           message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
//     }
//   }
//
//
//   @override
//   Future<Either<Failure, List<FinalAccountType>>> getAccountTypes() async {
//     try {
//       final AccountTypes = await remoteDataSource.getAccountTypes();
//       return Right(AccountTypes);
//     } on ResponseException catch (e) {
//       return Left(ResponseFailure(message: e.message));
//     } catch (e) {
//       return Left(ServerFailure(
//           message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
//     }
//   }
//
//
//
//
// //   @override
// //   Future<Either<Failure, String>> saveBondOfArrest(SaveTreeRequestModel newAccounts) async{
// //
// //     try {
// //     final vouchInfo =
// //     await remoteDataSource.ReceiptVouchersInfo(vouchinfo);
// //     print("rep $vouchInfo");
// //     return Right(vouchInfo.message!);
// //     } on ResponseException catch (e) {
// //     return Left(ResponseFailure(message: e.message));
// //     } catch (e) {
// //     return Left(ServerFailure(
// //     message: "خطأ في الاتصال بالمخدم يرجى المحاولة مرة أخرى"));
// //   }
// // }
