class VerifyOtpModel {
  bool? isRegistered;
  User? user;
  bool? success;
  String? message;
  String? token;

  VerifyOtpModel(
      {this.isRegistered, this.user, this.success, this.message, this.token});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    isRegistered = json['is_registered'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_registered'] = this.isRegistered;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}

class User {
  String? name;
  String? mobile;
  String? email;
  String? userId;
  String? dob;

  User({this.name, this.mobile, this.email, this.userId, this.dob});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    userId = json['user_id'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['user_id'] = this.userId;
    data['dob'] = this.dob;
    return data;
  }
}

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
