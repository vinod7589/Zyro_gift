class PineLabMinKycModel {
  bool? success;
  Data? data;
  String? message;
  Null? errors;
  Null? exception;

  PineLabMinKycModel(
      {this.success, this.data, this.message, this.errors, this.exception});

  PineLabMinKycModel.fromJson(Map<String, dynamic> json) {
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
  String? customerName;
  String? email;
  int? mobileNumber;
  String? webLink;
  String? linkExpiryDateTime;
  Null? additionalInfo;

  Data(
      {this.customerName,
      this.email,
      this.mobileNumber,
      this.webLink,
      this.linkExpiryDateTime,
      this.additionalInfo});

  Data.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    webLink = json['webLink'];
    linkExpiryDateTime = json['linkExpiryDateTime'];
    additionalInfo = json['additionalInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['webLink'] = this.webLink;
    data['linkExpiryDateTime'] = this.linkExpiryDateTime;
    data['additionalInfo'] = this.additionalInfo;
    return data;
  }
}
