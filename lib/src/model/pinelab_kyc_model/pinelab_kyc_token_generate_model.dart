class PineLabKycTokenGenerateModel {
  bool? success;
  Data? data;
  String? message;
  Null? errors;
  Null? exception;

  PineLabKycTokenGenerateModel(
      {this.success, this.data, this.message, this.errors, this.exception});

  PineLabKycTokenGenerateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    errors = json['errors'];
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['exception'] = this.exception;
    return data;
  }
}

class Data {
  String? token;
  String? expiresIn;
  String? refreshToken;
  String? refreshExpiresIn;

  Data({this.token, this.expiresIn, this.refreshToken, this.refreshExpiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiresIn = json['expiresIn'];
    refreshToken = json['refreshToken'];
    refreshExpiresIn = json['refreshExpiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiresIn'] = this.expiresIn;
    data['refreshToken'] = this.refreshToken;
    data['refreshExpiresIn'] = this.refreshExpiresIn;
    return data;
  }
}
