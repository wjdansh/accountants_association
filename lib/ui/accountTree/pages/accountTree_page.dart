import 'package:accountants_association/domain/entities/account_tree.dart';
import 'package:accountants_association/ui/login/bloc/login_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/colors_manager.dart';
import '../../../core/utils/constants.dart';

import '../../../data/datasources/accountTree_remote_data_source.dart';
import '../../../data/repositories/accountTree_repository_impl.dart';
import '../../../domain/repositories/accountTree_repository.dart';
import '../../../domain/usecases/get_account_info.dart';
import '../../accountSavedTree/pages/accountSavedTree_page.dart';
import '../../add_accounts/pages/add_accounts_page.dart';
import '../../widgets/filled_button.dart';
import '../../widgets/loading_view.dart';
import '../bloc/accountTree_bloc.dart';

class accountTreePage extends StatelessWidget {
  accountTreePage({Key? key}) : super(key: key);
  accountTreeRepository repoAcc = AccountTreeRepositoryImpl(
      remoteDataSource: AccountRemoteDataSourceImpl());

  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  List<AccountTree>? allAccount;

  @override
  Widget build(BuildContext context) {
    var accountBlocInstance =
        AccountBloc(getAccountInfo: GetAccountInfo(repoAcc));
    accountBlocInstance
        .add(GetAccountInformation(id: "0766d6a3-911e-4809-9b55-aa14e6667365"));
    return BlocProvider(
      create: (context) => accountBlocInstance,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            'شجرة الحسابات',
            textAlign: TextAlign.end,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: accountTreeLayout(context),
          // child: BlocListener<LoginBloc, LoginState>(
          //   listener: (context, state) {
          //     if (state is LoginError) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(state.message),
          //           backgroundColor: ColorsManager.red,
          //         ),
          //       );
          //     }
          //     // else if (state is LoginLoaded) {
          //     //   print("user id ${state.userInfo.userId}");
          //     //   Navigator.pushReplacement(
          //     //       context, MaterialPageRoute(builder: (_) => MainScreen()));
          //     // }
          //   },
          //   child: BlocBuilder<LoginBloc, LoginState>(
          //     builder: (context, state) {
          //       if (state is LoginInitial) {
          //         return LoginLayout();
          //       } else if (state is LoginLoading) {
          //         return const LoadingView();
          //       } else if (state is LoginLoaded) {
          //         return const LoadingView();
          //       } else if (state is LoginError) {
          //         return LoginLayout();
          //       }
          //       return LoginLayout();
          //     },
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget accountTreeLayout(BuildContext context) {
    Widget accountItems(
      int? accountNumber,
      String? accountName,
      int? finalAccountTypesId,
      double? creditor,
      double? debtor,
      String? taxNumber,
      String? commercialRegister,
    ) {
      return Material(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              accountNumber.toString(),
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              accountName.toString(),
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              finalAccountTypesId.toString(),
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              creditor.toString(),
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              debtor.toString(),
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              taxNumber ?? "---",
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Constants.horizontalSpaceTiny(),
            Text(
              commercialRegister ?? "---",
              //    textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }

    displayAccoutList() {
      // return Column(children: [Text(allAccount.toString())]);
      return ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: allAccount!
            .map((item) => accountItems(
                item.accountNumber,
                item.accountName,
                item.finalAccountTypesId,
                item.creditor,
                item.debtor,
                item.taxNumber,
                item.commercialRegister))
            .toList(),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Constants.verticalSpaceMedium(),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' رقم الحساب',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' اسم الحساب',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' الحساب الختامي',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' مدين',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' دائن',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' الرقم الضريبي',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Constants.horizontalSpaceTiny(),
                    Text(
                      ' رقم السجل التجاري',
                      //    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, state) {
                    if (state is AccountInitial) {
                      print('0000000');
                      return const LoadingView();
                    } else if (state is AccountLoading) {
                      print('1111111111111');
                      return const LoadingView();
                    } else if (state is AccountLoaded) {
                      print('3333');
                      allAccount = state.account_Info;
                      print('object $allAccount');
                      return Expanded(child: displayAccoutList());
                      //   Text(
                      //   allAccount!.first.accountName.toString(),
                      //   //    textAlign: TextAlign.center,
                      //   style: Theme.of(context).textTheme.bodySmall,
                      // );
                    } else if (state is AccountError) {
                      print('2222222222222');
                      print('state ${state.message}');
                      return const LoadingView();
                    }
                    return const LoadingView();
                  },
                ),
                //   ],
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledTextButton(
                    text: 'إضافة حسابات',
                    onPress: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => AddAccountsPage()));
                    }),
                FilledTextButton(
                    text: 'إضافة ميزان افتتاحي',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => accountSavedTreePage()));
                      // Get the Bloc using the BlocProvider
                      // final loginBloc = BlocProvider.of<LoginBloc>(context);
                      // loginBloc.add(GetUserInformation(
                      //     email: emailTextController!.text,
                      //     password: passwordTextController!.text));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
