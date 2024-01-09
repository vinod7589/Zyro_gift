class VerifyOtp {
  bool? success;
  String? message;
  String? token;

  VerifyOtp({this.success, this.message, this.token});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
