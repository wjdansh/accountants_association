import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../utils/app_preferences.dart';
import '../../utils/constants.dart';
import '../model/service_response_model.dart';

class BaseService {
  static final BaseService _instance = BaseService.internal();
  static const String baseUrl = Constants.API_URL;
  AppPreferences appPreferences = AppPreferences();

  BaseService.internal();

  factory BaseService() => _instance;

  Future<ServiceResponseModel> getRequest(String path,
      {int timeOut = 50}) async {
    try {
      String? cookies = await appPreferences.getCookies();
      return http.get(
        Uri.parse("$baseUrl$path"),
        headers: {"content-type": "application/json", "Cookie": cookies ?? ""},
      ).then((http.Response response) async {
        print("response from server is $response");
        ServiceResponseModel body =
            ServiceResponseModel.fromJson(json.decode(response.body));
        return body;
      });
    } catch (e) {
      // TODO: throw Server Exception
      return ServiceResponseModel(error: "حدث خطأ ما يرجى المحاولة لاحقاً");
    }
  }

  Future<ServiceResponseModel> postRequest(
      String path, Map<String, dynamic> data,
      {int timeOut = 50}) async {
    try {
      String? cookies = await appPreferences.getCookies();
      return http
          .post(
        Uri.parse("$baseUrl$path"),
        headers: {"content-type": "application/json", "Cookie": cookies ?? ""},
        body: jsonEncode(data),
      )
          .then((http.Response response) async {
        print("cookies is ${cookies}");
        print("data is ${jsonEncode(data)}");
        print("response from server is ${response.body}");
        print("status code from post is ${response.statusCode}");
        ServiceResponseModel body =
            ServiceResponseModel.fromJson(json.decode(response.body));
        return body;
      });
    } catch (e) {
      return ServiceResponseModel(error: "حدث خطأ ما يرجى المحاولة لاحقا");
    }
  }
}
