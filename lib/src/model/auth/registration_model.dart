class Signup {
  String? status;
  String? description;

  Signup({this.status, this.description});

  Signup.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['description'] = this.description;
    return data;
  }
}
