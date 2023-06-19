enum ServicePath {
  login,
  getAccountTree,
  getAccountSavedTree,
  transferredAccountsTree,
  editAccount,
  deleteAccount,
  finalAccountTypes,
  AccountTypes,
  AccountNum,
  getAllAccounts,
  saveAccountTree,
  AddReceiptVouchers,
  AddPaymentVouchers,
  AddRestrictionVoucher,
  GEtReceiptVouchers,
  GetPaymentVouchers,
  GetRestrictionVoucher,
}

extension ServicePathExt on ServicePath {
  String get getPath {
    switch (this) {
      case ServicePath.login:
        return "Account/signin";

      case ServicePath.getAccountTree:
        return "AccountsTrees/GetTransferedAccountsTree";

      case ServicePath.getAccountSavedTree:
        return "AccountsTrees/GetUnTransferedAccountsTree";

      case ServicePath.transferredAccountsTree:
        return "AccountsTrees/TransfereAccountTree";

      case ServicePath.editAccount:
        return "AccountsTrees/EditAccountTree";

      case ServicePath.deleteAccount:
        return "AccountsTrees/DeleteFromAccountTree";

      case ServicePath.finalAccountTypes:
        return "AccountsTrees/GetFinalAccountTypes";

      case ServicePath.saveAccountTree:
        return "AccountsTrees/AddAccountTree";

      case ServicePath.AccountTypes:
        return "Helpers/GetAccountTypes";

      case ServicePath.AccountNum:
        return "Helpers/GetClientNumberForAutoComplete";

      case ServicePath.GEtReceiptVouchers:
        return "Vouchers/GetReceiptVouchers";

      case ServicePath.GetPaymentVouchers:
        return "Vouchers/GetPaymentVouchers";

      case ServicePath.GetRestrictionVoucher:
        return "Vouchers/GetRestrictionVoucher";

      case ServicePath.AddReceiptVouchers:
        return "Vouchers/AddReceiptVouchers";
      case ServicePath.AddPaymentVouchers:
        return "Vouchers/AddPaymentVouchers";
      case ServicePath.AddRestrictionVoucher:
        return "Vouchers/AddRestrictionVoucher";

      case ServicePath.getAllAccounts:
        return "Helpers/GetAllAccounts";

      default:
        return "";
    }
  }
}
