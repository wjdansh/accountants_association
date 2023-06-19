import 'package:accountants_association/core/utils/constants.dart';
import 'package:accountants_association/domain/usecases/get_account_info.dart';
import 'package:accountants_association/ui/accountTree/pages/accountTree_page.dart';
import 'package:accountants_association/ui/login/bloc/login_bloc.dart';
import 'package:accountants_association/ui/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/accountTree_remote_data_source.dart';
import '../../data/datasources/login_remote_data_source.dart';
import '../../data/repositories/accountTree_repository_impl.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/repositories/accountTree_repository.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/get_user_info.dart';
import '../../ui/accountTree/bloc/accountTree_bloc.dart';

class viewsRouter {
  LoginRepository repo =
      LoginRepositoryImpl(remoteDataSource: LoginRemoteDataSourceImpl());
  accountTreeRepository repo_acT = AccountTreeRepositoryImpl(
      remoteDataSource: AccountRemoteDataSourceImpl());

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) =>
                LoginBloc(getUserInfo: GetUserInfo(repo)),
            child: LoginPage(),
          ),
        );

      case Constants.accountTree:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                AccountBloc(getAccountInfo: GetAccountInfo(repo_acT)),
            child: accountTreePage(),
          ),
        );
    }
  }
}
