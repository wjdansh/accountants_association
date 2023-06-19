class ServiceResponseModel {
  dynamic obj;
  late bool hasError;
  String? error;

  ServiceResponseModel({this.obj, this.hasError = true, this.error});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (obj != null) {
      data['obj'] = obj.toJson();
    }
    data['hasError'] = hasError;
    data['error'] = error;
    return data;
  }

  ServiceResponseModel.fromJson(Map<String, dynamic> json) {
    obj = json['obj'];
    hasError = json['hasError'];
    error = json['error'];
  }
}
