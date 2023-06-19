import 'package:flutter/material.dart';

class Constants {
  static const String API_URL = "http://185.194.124.200:3340/api/";
  //"http://10.0.0.54:3340/api/";
  static const String login = "/login";
  static const String accountTree = "/accountTree";
  // Vertical spacing constants. Adjust to your liking.
  static const double _spaceTiny = 2.0;
  static const double _spaceSmall = 10.0;
  static const double _spaceMedium = 20.0;
  static const double _spaceLarge = 60.0;

  static RoundedRectangleBorder kRoundedRectangle =
      const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)));

  // Dividers
  static VerticalDivider thinVerticalDivider = const VerticalDivider(
    thickness: 1,
    color: Colors.grey,
  );

  // static TextStyle kSmallTextStyle({Color color = Colors.grey}) =>
  //     TextStyle(fontSize: 14, color: color, fontFamily: "SF-Pro-Rounded");

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget horizontalSpaceTiny() {
    return horizontalSpace(_spaceTiny);
  }

  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_spaceSmall);
  }

  static Widget verticalSpaceSmall() {
    return verticalSpace(_spaceSmall);
  }

  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_spaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_spaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_spaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  static SnackBar simpleSnackBar(String message) => SnackBar(
        content: Text(message),
        backgroundColor: (Colors.black12),
      );
}
