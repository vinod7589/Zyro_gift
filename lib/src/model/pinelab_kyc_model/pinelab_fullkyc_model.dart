class PineLabFullKycModel {
  bool? success;
  Data? data;
  String? message;
  Null? errors;
  Null? exception;

  PineLabFullKycModel(
      {this.success, this.data, this.message, this.errors, this.exception});

  PineLabFullKycModel.fromJson(Map<String, dynamic> json) {
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
  String? mobileNumber;
  Null? additionalInfo;
  KycLink? kycLink;

  Data(
      {this.customerName,
      this.email,
      this.mobileNumber,
      this.additionalInfo,
      this.kycLink});

  Data.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    additionalInfo = json['additionalInfo'];
    kycLink =
        json['kycLink'] != null ? new KycLink.fromJson(json['kycLink']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['additionalInfo'] = this.additionalInfo;
    if (this.kycLink != null) {
      data['kycLink'] = this.kycLink!.toJson();
    }
    return data;
  }
}

class KycLink {
  String? webLink;
  String? mobileLink;
  String? linkExpiryDateTime;

  KycLink({this.webLink, this.mobileLink, this.linkExpiryDateTime});

  KycLink.fromJson(Map<String, dynamic> json) {
    webLink = json['webLink'];
    mobileLink = json['mobileLink'];
    linkExpiryDateTime = json['linkExpiryDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['webLink'] = this.webLink;
    data['mobileLink'] = this.mobileLink;
    data['linkExpiryDateTime'] = this.linkExpiryDateTime;
    return data;
  }
}
