class GetUserDetailModel {
  UserDetailsList? data;
  String? status;
  String? description;

  GetUserDetailModel({this.data, this.status, this.description});

  GetUserDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new UserDetailsList.fromJson(json['data'])
        : null;
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}

class UserDetailsList {
  String? mobileNumber;
  String? userId;
  String? name;
  String? email;
  String? dob;

  UserDetailsList(
      {this.mobileNumber, this.userId, this.name, this.email, this.dob});

  UserDetailsList.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    userId = json['user_Id'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['user_Id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dob'] = this.dob;
    return data;
  }
}
