import 'package:accountants_association/data/datasources/login_remote_data_source.dart';
import 'package:accountants_association/data/repositories/login_repository_impl.dart';
import 'package:accountants_association/domain/repositories/login_repository.dart';
import 'package:accountants_association/domain/usecases/get_user_info.dart';
import 'package:accountants_association/ui/accountTree/bloc/accountTree_bloc.dart';
import 'package:accountants_association/ui/login/bloc/login_bloc.dart';
import 'package:accountants_association/ui/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/styles.dart';
import 'data/datasources/accountTree_remote_data_source.dart';
import 'data/repositories/accountTree_repository_impl.dart';
import 'domain/repositories/accountTree_repository.dart';
import 'domain/usecases/get_account_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  LoginRepository repo =
      LoginRepositoryImpl(remoteDataSource: LoginRemoteDataSourceImpl());
  // accountTreeRepository repoAcc = AccountTreeRepositoryImpl(
  //     remoteDataSource: AccountRemoteDataSourceImpl());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حساباتي',
      locale: Locale("ar"),
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home:
          // MultiBlocProvider(
          //   providers: [
          //     BlocProvider(
          //       create: (context) => LoginBloc(getUserInfo: GetUserInfo(repo)),
          //     ),
          //     // BlocProvider(
          //     //   create: (context) =>
          //     //       AccountBloc(getAccountInfo: GetAccountInfo(repoAcc)),
          //     // ),
          //   ],
          //   child: LoginPage(),
          // )
          BlocProvider(
        create: (BuildContext context) =>
            LoginBloc(getUserInfo: GetUserInfo(repo)),
        child: LoginPage(),
      ),
    );
  }
}
